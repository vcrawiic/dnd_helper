import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/pages/monsters/models/monsters_info_wiget_model.dart';
import 'package:dnd_helper/widgets/chip_list.dart';
import 'package:dnd_helper/widgets/info_chip.dart';
import 'package:dnd_helper/widgets/info_container.dart';
import 'package:dnd_helper/widgets/image_placeholder.dart';
import 'package:dnd_helper/widgets/section_title.dart';
import 'package:flutter/material.dart';

class MonsterInfoWidget extends StatelessWidget {
  const MonsterInfoWidget({super.key, required this.monsterItem});

  final Monster monsterItem;

  @override
  Widget build(BuildContext context) {
    final model = MonstersInfoWigetModel(monsterItem: monsterItem);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // MARK: - Left side widgets
                Expanded(
                  child: Column(
                    spacing: 18,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Pallete.primaryText,
                            height: 1,
                          ),
                        ),
                        Text(
                          '(${model.size})',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Pallete.secondaryText,
                            height: 1,
                          ),
                        ),
                        Text(
                          'Type: ${model.type}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Pallete.secondaryText,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.xp} XP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Challenge Rating: ${model.challengeRating}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Armor Class: ${model.armorClass}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(spacing: 14,
                      children: [
                        InfoContainer(
                          width: 180,
                          child: Text(
                            'Blindsight: ${model.blindsight}\nDarkvision: ${model.darkvision}\nPassive perception: ${model.passivePerception}\nTremor sense: ${model.tremorSense}\nTruesight: ${model.truesight}',
                          ),
                        ),
                        InfoContainer(
                          width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textAlign: TextAlign.left,
                                'Burrow: ${model.burrow}\nClimb: ${model.climb}\nFly: ${model.fly}',
                              ),
                              Text(
                                textAlign: TextAlign.right,
                                'Hover: ${model.hover}\nSwim: ${model.swim}\nWalk: ${model.walk}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (model.hasDamageModifiers) ...[
                      if (model.damageImmunities.isNotEmpty) ...[
                        SectionTitle(title: 'Damage Immunities:'),
                        ChipList(
                          children: model.damageImmunities
                              .map((immunity) => InfoChip(label: immunity))
                              .toList(),
                        ),
                      ],
                      if (model.damageResistances.isNotEmpty) ...[
                        SectionTitle(title: 'Damage Resistances:'),
                        ChipList(
                          children: model.damageResistances
                              .map((resistance) => InfoChip(label: resistance))
                              .toList(),
                        ),
                      ],
                      if (model.damageVulnerabilities.isNotEmpty) ...[
                        SectionTitle(title: 'Damage Vulnerabilities:'),
                        ChipList(
                          children: model.damageVulnerabilities
                              .map((vulnerability) => InfoChip(label: vulnerability))
                              .toList(),
                        ),
                      ],
                    ],
                  ],
                  ),
                ),
                SizedBox(width: 16),
                // MARK: - Right side widgets
                Column(spacing: 22,
                  children: [
                    ImagePlaceholder(
                      imageUrl: model.imageUrl,
                      width: 150,
                      height: 124,
                    ),
                    InfoContainer(
                      width: 150,
                      backgroundColor: Pallete.greyDark,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            style: TextStyle(height: 2),
                            'CHA: ${model.charisma}\nCON: ${model.constitution}\nDEX: ${model.dexterity}',
                          ),
                          Text(
                            textAlign: TextAlign.right,
                            style: TextStyle(height: 2),
                            'INT: ${model.intelligence}\nSTR: ${model.strength}\nWIS: ${model.wisdom}',
                          ),
                        ],
                      ),
                    ),
                    InfoContainer(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                'Hit points roll:\n${model.hitPointsRoll}',
                              ),
                              Text('or', style: TextStyle(fontSize: 12)),
                              Text('Hit points: ${model.hitPoints}'),
                            ],
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}