import 'package:dnd_helper/models/monsters/enum_values.dart';

enum MonsterSize { GARGANTUAN, HUGE, LARGE, MEDIUM }

final sizeValues = EnumValues({
  "Gargantuan": MonsterSize.GARGANTUAN,
  "Huge": MonsterSize.HUGE,
  "Large": MonsterSize.LARGE,
  "Medium": MonsterSize.MEDIUM,
});
