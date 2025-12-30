import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/classes/class.dart';
import 'package:dnd_helper/pages/classes/models/class_info_widget_model.dart';
import 'package:dnd_helper/widgets/info_chip.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:dnd_helper/widgets/section_title.dart';
import 'package:dnd_helper/widgets/chip_list.dart';
import 'package:flutter/material.dart';

class ClassInfoWidget extends StatelessWidget {
  const ClassInfoWidget({super.key, required this.classItem});
  final Class classItem;

  @override
  Widget build(BuildContext context) {
    final model = ClassInfoWidgetModel(classItem: classItem);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 90),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.className,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Pallete.primaryWhiteText,
              ),
            ),
            SectionTitle(title: 'Saving throws:'),
            ChipList(
              children: [
                ...model.savingThrowsNames.asMap().entries.map((entry) {
                  final index = entry.key;
                  final stItem = entry.value;
                  return InfoChip(
                    label: stItem,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => LiquidContainer(radius: 12,
                          child: AlertDialog(
                            backgroundColor: Pallete.primaryBGAlpha100,
                            title: Text(stItem),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Pallete.primaryBlackText,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  model.savingThrowsDescriptions[index],
                                  style: TextStyle(
                                    color: Pallete.primaryBlackText,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Skills:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Pallete.primaryBlackText,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  model.savingThrowsSkills[index],
                                  style: TextStyle(
                                    color: Pallete.primaryBlackText,
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'Close',
                                  style: TextStyle(
                                    color: Pallete.primaryBlackText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
            SectionTitle(title: 'Proficiencies:'),
            ChipList(
              children: model.proficienciesNames.map((prof) {
                return InfoChip(label: prof);
              }).toList(),
            ),
            if (model.spellcastingLevel != null) ...[
              SectionTitle(title: 'Spellcasting:'),
              Text(
                'Level: ${model.spellcastingLevel}',
                style: TextStyle(color: Pallete.primaryWhiteText),
              ),
              Text(
                'Ability: ${model.spellcastingAbilityName}',
                style: TextStyle(color: Pallete.primaryWhiteText),
              ),
              if (model.spellcastingInfoNames.isNotEmpty) ...[
                SizedBox(height: 8),
                Text(
                  'Info:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Pallete.primaryWhiteText,
                  ),
                ),
                ...model.spellcastingInfoNames.asMap().entries.map((entry) {
                  final index = entry.key;
                  final name = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Pallete.primaryWhiteText,
                          ),
                        ),
                        Text(
                          model.spellcastingInfoDescriptions[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: Pallete.primaryWhiteText,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
