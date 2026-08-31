abstract class AppRoutes {
  static const auth = '/auth';

  // Табы
  static const reference = '/reference';
  static const tabletop = '/tabletop';
  static const dices = '/dices';
  static const characters = '/characters';
  static const profile = '/profile';

  // Дочерние маршруты справочника
  static const classes = 'classes';
  static const monsters = 'monsters';
  static const classInfo = 'info';
  static const monsterInfo = 'info';

  // Character sheet routes
  static const charSheet = 'char_sheet';
  static const xpCalculator = 'xp_calculator';
  static const hpCalculator = 'hp_calculator';
  static const generalSettings = 'general_settings';
  static const statesSettings = 'states_settings';
}
