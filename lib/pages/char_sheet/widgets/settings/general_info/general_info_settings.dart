import 'package:dnd_helper/pages/char_sheet/providers/char_stats_provider.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/general_info/settings_tile.dart';
import 'package:dnd_helper/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeneralInfoSettings extends ConsumerStatefulWidget {
  final String characterId;

  const GeneralInfoSettings({super.key, required this.characterId});

  @override
  ConsumerState<GeneralInfoSettings> createState() =>
      _GeneralInfoSettingsState();
}

class _GeneralInfoSettingsState extends ConsumerState<GeneralInfoSettings> {
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

  bool _initialized = false;

  @override
  void dispose() {
    _nameController.dispose();
    _raceController.dispose();
    _classController.dispose();
    _archetypeController.dispose();
    _armorClassController.dispose();
    _shieldClassController.dispose();
    _speedController.dispose();
    _initiativeController.dispose();
    super.dispose();
  }

  void _initControllers(stats) {
    if (_initialized) return;
    _initialized = true;

    _nameController.text = stats.name;
    _raceController.text = stats.race;
    _classController.text = stats.characterClass;
    _archetypeController.text = stats.archetype;
    _armorClassController.text = stats.armorClass.toString();
    _shieldClassController.text = stats.shieldAC.toString();
    _speedController.text = stats.speed.toString();
    _initiativeController.text = stats.initiative.toString();
  }

  void _saveChanges() {
    final notifier = ref.read(charStatsProvider(widget.characterId).notifier);

    notifier.updateGeneralInfo(
      name: _nameController.text,
      race: _raceController.text,
      characterClass: _classController.text,
      archetype: _archetypeController.text,
      armorClass: int.tryParse(_armorClassController.text) ?? 10,
      shieldAC: int.tryParse(_shieldClassController.text) ?? 0,
      speed: int.tryParse(_speedController.text) ?? 30,
      initiative: int.tryParse(_initiativeController.text) ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final statsAsync = ref.watch(charStatsProvider(widget.characterId));

    return statsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (stats) {
        _initControllers(stats);
        return _buildForm();
      },
    );
  }

  Widget _buildForm() {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _nameController,
                  labelText: 'Name',
                  onEditingComplete: _saveChanges,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  controller: _raceController,
                  labelText: 'Race',
                  onEditingComplete: _saveChanges,
                ),
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _classController,
                  labelText: 'Class',
                  onEditingComplete: _saveChanges,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  controller: _archetypeController,
                  labelText: 'Archetype',
                  onEditingComplete: _saveChanges,
                ),
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _armorClassController,
                  labelText: 'AC',
                  onEditingComplete: _saveChanges,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  controller: _shieldClassController,
                  labelText: 'Shield AC',
                  onEditingComplete: _saveChanges,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  controller: _speedController,
                  labelText: 'Speed',
                  onEditingComplete: _saveChanges,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  controller: _initiativeController,
                  labelText: 'Initiative',
                  onEditingComplete: _saveChanges,
                ),
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
