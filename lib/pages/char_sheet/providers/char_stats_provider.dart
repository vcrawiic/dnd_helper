import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/char_stats_model.dart';
import '../models/char_stats_mapper.dart';
import '../models/blocks/progression.dart';

part 'char_stats_provider.g.dart';

@riverpod
class CharStatsNotifier extends _$CharStatsNotifier {
  @override
  Future<CharStats> build(String characterId) async {
    if (characterId.isEmpty) {
      return const CharStats();
    }
    return _loadFromFirebase(characterId);
  }

  Future<CharStats> _loadFromFirebase(String characterId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('characters')
          .doc(characterId)
          .get();

      if (!doc.exists) {
        return const CharStats();
      }

      return CharStatsMapper.fromFirestore(doc);
    } catch (e) {
      debugPrint('Error loading character: $e');
      return const CharStats();
    }
  }

  Future<void> _saveToFirebase(CharStats stats) async {
    await FirebaseFirestore.instance
        .collection('characters')
        .doc(characterId)
        .set(CharStatsMapper.toFirestore(stats));
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
    state = AsyncData(updated);
    await _saveToFirebase(updated);
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
    state = AsyncData(updated);
    await _saveToFirebase(updated);
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
    state = AsyncData(updated);
    await _saveToFirebase(updated);
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
    state = AsyncData(updated);
    await _saveToFirebase(updated);
  }

  Future<void> levelUp() async {
    final current = state.value!;
    if (current.canLevelUp) {
      final updated = current.copyWith(
        progression: current.progression.copyWith(level: current.level + 1),
      );
      state = AsyncData(updated);
      await _saveToFirebase(updated);
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
    state = AsyncData(updated);
    await _saveToFirebase(updated);
  }
}
