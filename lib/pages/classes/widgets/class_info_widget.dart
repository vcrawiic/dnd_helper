import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/classes/class.dart';
import 'package:dnd_helper/pages/classes/models/class_info_widget_model.dart';
import 'package:dnd_helper/widgets/info_chip.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.className,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Pallete.primaryText,
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
                        builder: (context) => AlertDialog(backgroundColor: Pallete.primaryBG,
                          title: Text(stItem,),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(model.savingThrowsDescriptions[index]),
                              SizedBox(height: 16),
                              Text(
                                'Skills:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(model.savingThrowsSkills[index]),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close', style: TextStyle(color: Pallete.primaryText),),
                            ),
                          ],
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
              Text('Level: ${model.spellcastingLevel}'),
              Text('Ability: ${model.spellcastingAbilityName}'),
              if (model.spellcastingInfoNames.isNotEmpty) ...[
                SizedBox(height: 8),
                Text('Info:', style: TextStyle(fontWeight: FontWeight.bold)),
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
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          model.spellcastingInfoDescriptions[index],
                          style: TextStyle(fontSize: 12),
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
