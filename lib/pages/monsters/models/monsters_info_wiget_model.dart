import 'package:dnd_helper/models/monsters/armor_class.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_size.dart';
import 'package:dnd_helper/models/monsters/monster_speed.dart';
import 'package:dnd_helper/models/monsters/senses.dart';

class MonstersInfoWigetModel {
  MonstersInfoWigetModel({required this.monsterItem});

  final Monster monsterItem;

  // Basic info
  String get name => monsterItem.name ?? 'Unknown';
  String get size => _formatSize(monsterItem.size);
  String get type => monsterItem.type ?? '-';
  String get imageUrl => monsterItem.image != null
      ? 'https://www.dnd5eapi.co${monsterItem.image}'
      : '';

  // Stats
  int get xp => monsterItem.xp ?? 0;
  int get challengeRating => monsterItem.challengeRating ?? 0;
  String get hitPointsRoll => monsterItem.hitPointsRoll ?? '-';
  int get hitPoints => monsterItem.hitPoints ?? 0;
  String get hitDice => monsterItem.hitDice ?? '-';

  // Armor Class
  String get armorClass {
    if (monsterItem.armorClass == null || monsterItem.armorClass!.isEmpty) {
      return '-';
    }
    return monsterItem.armorClass!
        .map((ac) => '${ac.value ?? 0} (${_formatArmorType(ac.type)})')
        .join(', ');
  }

  // Damage modifiers
  List<String> get damageImmunities =>
      _splitDamageTypes(monsterItem.damageImmunities ?? []);

  List<String> get damageResistances =>
      _splitDamageTypes(monsterItem.damageResistances ?? []);

  List<String> get damageVulnerabilities =>
      _splitDamageTypes(monsterItem.damageVulnerabilities ?? []);

  bool get hasDamageModifiers =>
      damageImmunities.isNotEmpty ||
      damageResistances.isNotEmpty ||
      damageVulnerabilities.isNotEmpty;

  List<String> _splitDamageTypes(List<String> damageList) {
    final result = <String>[];
    for (final damage in damageList) {
      if (damage.contains(' from ')) {
        final mainParts = damage.split(' from ');
        final damageTypes = mainParts[0]
            .split(RegExp(r',\s*and\s+|,\s*|\s+and\s+'))
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty)
            .toList();

        final condition = mainParts.length > 1 ? ' from ${mainParts[1]}' : '';

        for (final type in damageTypes) {
          result.add('$type$condition');
        }
      } else {
        final parts = damage
            .split(RegExp(r',\s*and\s+|,\s*|\s+and\s+'))
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty)
            .toList();
        result.addAll(parts);
      }
    }
    return result;
  }

  // Attributes
  int get charisma => monsterItem.charisma ?? 0;
  int get constitution => monsterItem.constitution ?? 0;
  int get dexterity => monsterItem.dexterity ?? 0;
  int get intelligence => monsterItem.intelligence ?? 0;
  int get strength => monsterItem.strength ?? 0;
  int get wisdom => monsterItem.wisdom ?? 0;

  // Senses
  String get blindsight => _formatBlindsight(monsterItem.senses?.blindsight);
  String get darkvision => _formatDarkvision(monsterItem.senses?.darkvision);
  String get passivePerception => '${monsterItem.senses?.passivePerception ?? '-'}';
  String get tremorSense => _formatBlindsight(monsterItem.senses?.tremorsense);
  String get truesight => _formatBlindsight(monsterItem.senses?.truesight);

  // Speed
  String get burrow => _formatBurrow(monsterItem.speed?.burrow);
  String get climb => _formatBurrow(monsterItem.speed?.climb);
  String get fly => monsterItem.speed?.fly ?? '-';
  String get hover => '${monsterItem.speed?.hover ?? '-'}';
  String get swim => monsterItem.speed?.swim ?? '-';
  String get walk => _formatBurrow(monsterItem.speed?.walk);

  // Private formatters
  String _formatSize(MonsterSize? size) {
    if (size == null) return 'Unknown';
    return sizeValues.reverse[size] ?? 'Unknown';
  }

  String _formatArmorType(Type? type) {
    if (type == null) return 'natural';
    final typeStr = typeValues.reverse[type] ?? 'natural';
    return typeStr;
  }

  String _formatBlindsight(dynamic value) {
    if (value == null) return '-';
    return blindsightValues.reverse[value] ?? '-';
  }

  String _formatDarkvision(dynamic value) {
    if (value == null) return '-';
    return darkvisionValues.reverse[value] ?? '-';
  }

  String _formatBurrow(dynamic value) {
    if (value == null) return '-';
    return burrowValues.reverse[value] ?? '-';
  }
}