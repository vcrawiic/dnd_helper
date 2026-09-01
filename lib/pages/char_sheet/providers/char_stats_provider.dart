import 'dart:convert';

import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/services/api/api_client.dart';
import 'package:dnd_helper/utils/debouncer.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/char_stats_model.dart';
import '../models/char_stats_mapper.dart';
import '../models/blocks/progression.dart';
import '../models/blocks/proficiencies.dart';

part 'char_stats_provider.g.dart';

@riverpod
class CharStatsNotifier extends _$CharStatsNotifier {
  /// Серия быстрых правок (степперы, набор текста, тоглы) схлопывается в один
  /// PUT после паузы — чтобы не долбить бэк на каждое промежуточное изменение.
  final _saveDebouncer = Debouncer(const Duration(milliseconds: 700));

  /// JSON последнего отправленного состояния — для пропуска no-op сохранений.
  String? _lastSentJson;

  @override
  Future<CharStats> build(String characterId) async {
    // При уходе с листа дослать отложенное сохранение и снять таймер.
    ref.onDispose(() {
      _saveDebouncer.flush();
      _saveDebouncer.dispose();
    });

    if (characterId.isEmpty) {
      return const CharStats();
    }
    return _loadFromApi(characterId);
  }

  /// Оптимистично обновить локальный стейт и запланировать отложенный PUT
  /// с последним состоянием (серия правок → один запрос).
  void _apply(CharStats updated) {
    state = AsyncData(updated);
    _saveDebouncer.run(() {
      final current = state.value;
      if (current != null) _saveToApi(current);
    });
  }

  Future<CharStats> _loadFromApi(String characterId) async {
    try {
      final response = await GlobalDependencies.apiClient.req(
        Endpoint.characters,
        Method.get,
        null,
        pathSuffix: '/$characterId',
      );
      final stats = CharStatsMapper.fromBackendJson(response.data);
      _lastSentJson = jsonEncode(CharStatsMapper.toBackendJson(stats));
      return stats;
    } catch (e) {
      debugPrint('Error loading character: $e');
      return const CharStats();
    }
  }

  Future<void> _saveToApi(CharStats stats) async {
    final payload = CharStatsMapper.toBackendJson(stats);
    final encoded = jsonEncode(payload);
    if (encoded == _lastSentJson) return; // нечего сохранять
    _lastSentJson = encoded;
    try {
      await GlobalDependencies.apiClient.req(
        Endpoint.characters,
        Method.put,
        payload,
        pathSuffix: '/$characterId',
      );
    } catch (e) {
      _lastSentJson = null; // дать шанс повторить при следующем изменении
      debugPrint('Error saving character: $e');
    }
  }

  Future<void> updateGeneralInfo({
    String? name,
    String? race,
    String? characterClass,
    String? archetype,
  }) async {
    final current = state.value!;
    final updated = current.copyWith(
      generalInfo: current.generalInfo.copyWith(
        name: name,
        race: race,
        characterClass: characterClass,
        archetype: archetype,
      ),
    );
    _apply(updated);
  }

  Future<void> updateCombat({
    int? armorClass,
    bool? hasShield,
    int? speed,
    int? initiative,
  }) async {
    final current = state.value!;
    final updated = current.copyWith(
      combat: current.combat.copyWith(
        armorClass: armorClass,
        hasShield: hasShield,
        speed: speed,
        initiative: initiative,
      ),
    );
    _apply(updated);
  }

  Future<void> updateHitPoints({
    int? current,
    int? max,
    int? temp,
    int? maxBonus,
    List<int>? hitDice,
  }) async {
    final currentStats = state.value!;
    final updated = currentStats.copyWith(
      hitPoints: currentStats.hitPoints.copyWith(
        current: current,
        max: max,
        temp: temp,
        maxBonus: maxBonus,
        hitDice: hitDice,
      ),
    );
    _apply(updated);
  }

  Future<void> heal(int amount) async {
    final current = state.value!;
    final hp = current.hitPoints;
    final newCurrent = (hp.current + amount).clamp(0, hp.effectiveMax);
    await updateHitPoints(current: newCurrent);
  }

  Future<void> damage(int amount) async {
    final current = state.value!;
    final hp = current.hitPoints;

    int newTemp = hp.temp;
    int remainingDamage = amount;

    if (newTemp > 0) {
      if (remainingDamage >= newTemp) {
        remainingDamage -= newTemp;
        newTemp = 0;
      } else {
        newTemp -= remainingDamage;
        remainingDamage = 0;
      }
    }

    final newCurrent = hp.current - remainingDamage;
    await updateHitPoints(current: newCurrent, temp: newTemp);
  }

  Future<void> addTempHp(int amount) async {
    final current = state.value!;
    final hp = current.hitPoints;
    final newTemp = amount > hp.temp ? amount : hp.temp;
    await updateHitPoints(temp: newTemp);
  }

  Future<void> addXp(int amount) async {
    final current = state.value!;
    final newXp = (current.currentXp + amount).clamp(0, 999999);

    int newLevel = current.level;

    if (amount < 0) {
      while (newLevel > 1 && newXp < Progression.xpThresholds[newLevel]!) {
        newLevel--;
      }
    }

    final updated = current.copyWith(
      progression: current.progression.copyWith(
        currentXp: newXp,
        level: newLevel,
      ),
    );
    _apply(updated);
  }

  Future<void> levelUp() async {
    final current = state.value!;
    if (current.canLevelUp) {
      final updated = current.copyWith(
        progression: current.progression.copyWith(level: current.level + 1),
      );
      _apply(updated);
    }
  }

  Future<void> updateConditions({
    int? inspiration,
    int? exhaustion,
    List<String>? states,
  }) async {
    final current = state.value!;
    final updated = current.copyWith(
      conditions: current.conditions.copyWith(
        inspiration: inspiration,
        exhaustion: exhaustion,
        states: states,
      ),
    );
    _apply(updated);
  }

  /// Тап по точке навыка циклит состояние: пусто → владение → компетентность →
  /// пусто. Компетентность подразумевает владение.
  void cycleSkillProficiency(String skillKey) {
    final current = state.value!;
    final prof = current.proficiencies;
    final skills = Set<String>.from(prof.skills);
    final expertise = Set<String>.from(prof.expertise);

    if (expertise.contains(skillKey)) {
      // компетентность → пусто
      expertise.remove(skillKey);
      skills.remove(skillKey);
    } else if (skills.contains(skillKey)) {
      // владение → компетентность
      expertise.add(skillKey);
    } else {
      // пусто → владение
      skills.add(skillKey);
    }

    _apply(
      current.copyWith(
        proficiencies: prof.copyWith(skills: skills, expertise: expertise),
      ),
    );
  }

  /// Переключить владение спасброском характеристики ('str'/'dex'/...).
  void toggleSaveProficiency(String ability) {
    final current = state.value!;
    _apply(
      current.copyWith(
        proficiencies: current.proficiencies.copyWith(
          savingThrows: Proficiencies.toggled(
            current.proficiencies.savingThrows,
            ability,
          ),
        ),
      ),
    );
  }
}
