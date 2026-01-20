import 'package:dnd_helper/pages/char_sheet/widgets/settings_tile.dart';
import 'package:dnd_helper/widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GeneralInfoSettings extends StatefulWidget {
  const GeneralInfoSettings({super.key});

  @override
  State<GeneralInfoSettings> createState() => _GeneralInfoSettingsState();
}

class _GeneralInfoSettingsState extends State<GeneralInfoSettings> {
  static const _settingsItems = [
    'Throw settings',
    'Class settings',
    'Spells and cantrips settings',
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _raceController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _archetypeController = TextEditingController();
  final TextEditingController _armorClassController = TextEditingController();
  final TextEditingController _shieldClassController = TextEditingController();
  final TextEditingController _speedController = TextEditingController();
  final TextEditingController _initiativeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              CustomTextField(controller: _nameController, labelText: 'Name'),
              CustomTextField(controller: _raceController, labelText: 'Race'),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              CustomTextField(controller: _classController, labelText: 'Class'),
              CustomTextField(
                controller: _archetypeController,
                labelText: 'Archetype',
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              CustomTextField(
                controller: _armorClassController,
                labelText: 'AC',
              ),
              CustomTextField(
                controller: _shieldClassController,
                labelText: 'Shield AC',
              ),
              CustomTextField(controller: _speedController, labelText: 'Speed'),
              CustomTextField(
                controller: _initiativeController,
                labelText: 'Initiative',
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _settingsItems.length,
            itemBuilder: (context, index) {
              final title = _settingsItems[index];
              return SettingsTile(
                title: title,
                onTap: () => debugPrint(title),
              );
            },
          ),
        ],
      ),
    );
  }
}
