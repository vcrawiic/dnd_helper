import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dnd_helper/pages/char_sheet/models/char_stats_model.dart';

class CharStatsMapper {
  CharStatsMapper._();

  static CharStats fromJson(Map<String, dynamic> json) {
    return CharStats(
      name: json['name'] as String? ?? '',
      race: json['race'] as String? ?? '',
      characterClass: json['characterClass'] as String? ?? '',
      archetype: json['archetype'] as String? ?? '',
      strength: json['strength'] as int? ?? 10,
      dexterity: json['dexterity'] as int? ?? 10,
      constitution: json['constitution'] as int? ?? 10,
      intelligence: json['intelligence'] as int? ?? 10,
      wisdom: json['wisdom'] as int? ?? 10,
      charisma: json['charisma'] as int? ?? 10,
      armorClass: json['armorClass'] as int? ?? 10,
      shieldAC: json['shieldAC'] as int? ?? 0,
      speed: json['speed'] as int? ?? 30,
      initiative: json['initiative'] as int? ?? 0,
      currentHp: json['currentHp'] as int? ?? 10,
      maxHp: json['maxHp'] as int? ?? 10,
      tempHp: json['tempHp'] as int? ?? 0,
      level: json['level'] as int? ?? 1,
      currentXp: json['currentXp'] as int? ?? 0,
      inspiration: json['inspiration'] as int? ?? 0,
      exhaustion: json['exhaustion'] as int? ?? 0,
      states:
          (json['states'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  static Map<String, dynamic> toJson(CharStats stats) {
    return {
      'name': stats.name,
      'race': stats.race,
      'characterClass': stats.characterClass,
      'archetype': stats.archetype,
      'strength': stats.strength,
      'dexterity': stats.dexterity,
      'constitution': stats.constitution,
      'intelligence': stats.intelligence,
      'wisdom': stats.wisdom,
      'charisma': stats.charisma,
      'armorClass': stats.armorClass,
      'shieldAC': stats.shieldAC,
      'speed': stats.speed,
      'initiative': stats.initiative,
      'currentHp': stats.currentHp,
      'maxHp': stats.maxHp,
      'tempHp': stats.tempHp,
      'level': stats.level,
      'currentXp': stats.currentXp,
      'inspiration': stats.inspiration,
      'exhaustion': stats.exhaustion,
      'states': stats.states,
    };
  }

  static CharStats fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) {
      return const CharStats();
    }
    return fromJson(data);
  }

  static Map<String, dynamic> toFirestore(CharStats stats) {
    return {...toJson(stats), 'updatedAt': FieldValue.serverTimestamp()};
  }
}
