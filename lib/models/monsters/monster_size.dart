import 'package:dnd_helper/models/monsters/enum_values.dart';

enum MonsterSize { TINY, SMALL, MEDIUM, LARGE, HUGE, GARGANTUAN }

final sizeValues = EnumValues({
  "Tiny": MonsterSize.TINY,
  "Small": MonsterSize.SMALL,
  "Medium": MonsterSize.MEDIUM,
  "Large": MonsterSize.LARGE,
  "Huge": MonsterSize.HUGE,
  "Gargantuan": MonsterSize.GARGANTUAN,
});
