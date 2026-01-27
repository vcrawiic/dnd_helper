import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/char_stats_model.dart';
import '../models/char_stats_mapper.dart';

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

  Future<void> addXp(int amount) async {
    final current = state.value!;
    final newXp = (current.currentXp + amount).clamp(0, 999999);

    int newLevel = current.level;

    if (amount < 0) {
      while (newLevel > 1 && newXp < CharStats.xpThresholds[newLevel]!) {
        newLevel--;
      }
    }

    final updated = current.copyWith(currentXp: newXp, level: newLevel);
    state = AsyncData(updated);
    await _saveToFirebase(updated);
  }

  Future<void> levelUp() async {
    final current = state.value!;
    if (current.canLevelUp) {
      final updated = current.copyWith(level: current.level + 1);
      state = AsyncData(updated);
      await _saveToFirebase(updated);
    }
  }

  Future<void> updateGeneralInfo({
    String? name,
    String? race,
    String? characterClass,
    String? archetype,
    int? armorClass,
    int? shieldAC,
    int? speed,
    int? initiative,
  }) async {
    final current = state.value!;
    final updated = current.copyWith(
      name: name,
      race: race,
      characterClass: characterClass,
      archetype: archetype,
      armorClass: armorClass,
      shieldAC: shieldAC,
      speed: speed,
      initiative: initiative,
    );
    state = AsyncData(updated);
    await _saveToFirebase(updated);
  }
}
