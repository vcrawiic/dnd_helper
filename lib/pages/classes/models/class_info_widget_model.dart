import 'package:dnd_helper/models/classes/class.dart';

class ClassInfoWidgetModel {
  ClassInfoWidgetModel({required this.classItem});
  final Class classItem;

  String get className => classItem.name ?? 'Unknown';

  List<String> get savingThrowsNames =>
      classItem.savingThrows?.map((st) => st.fullName ?? 'Unknown').toList() ??
      [];

  List<String> get savingThrowsDescriptions =>
      classItem.savingThrows
          ?.map((st) => st.desc?.join(',') ?? 'Unknown')
          .toList() ??
      [];

  List<String> get savingThrowsSkills =>
      classItem.savingThrows
          ?.map(
            (st) =>
                st.skills?.map((skill) => skill.name ?? 'Unknown').join(', ') ??
                'No skills',
          )
          .toList() ??
      [];

  List<String> get proficienciesNames =>
      classItem.proficiencies?.map((prof) => prof.name ?? 'Unknown').toList() ??
      [];

  int? get spellcastingLevel => classItem.spellcasting?.level;

  String get spellcastingAbilityName =>
      classItem.spellcasting?.spellcastingAbility?.name ?? 'None';

  List<String> get spellcastingInfoNames =>
      classItem.spellcasting?.info
          ?.map((info) => info.name ?? 'Unknown')
          .toList() ??
      [];

  List<String> get spellcastingInfoDescriptions =>
      classItem.spellcasting?.info
          ?.map((info) => info.desc?.join(', ') ?? 'No description')
          .toList() ??
      [];
}
