import 'package:dnd_helper/pages/char_sheet/widgets/settings/general_info/states/states_list.dart';

abstract class AppRoutes {
  static const auth = '/auth';

  static const classes = '/classes';
  static const monsters = '/monsters';
  static const dices = '/dices';
  static const profile = '/profile';

  static const classInfo = 'info';
  static const monsterInfo = 'info';

  // Character sheet routes
  static const charSheet = 'char_sheet';
  static const xpCalculator = 'xp_calculator';
  static const hpCalculator = 'hp_calculator';
  static const generalSettings = 'general_settings';
  static const statesSettings = 'states_settings';
}