import 'package:dnd_helper/models/monsters_info/enum_values.dart';

class MonsterSpeed {
  Burrow? burrow;
  Burrow? climb;
  String? fly;
  bool? hover;
  String? swim;
  Burrow? walk;

  MonsterSpeed({
    this.burrow,
    this.climb,
    this.fly,
    this.hover,
    this.swim,
    this.walk,
  });

  factory MonsterSpeed.fromJson(Map<String, dynamic> json) => MonsterSpeed(
    burrow: burrowValues.map[json["burrow"]]!,
    climb: burrowValues.map[json["climb"]]!,
    fly: json["fly"],
    hover: json["hover"],
    swim: json["swim"],
    walk: burrowValues.map[json["walk"]]!,
  );

  Map<String, dynamic> toJson() => {
    "burrow": burrowValues.reverse[burrow],
    "climb": burrowValues.reverse[climb],
    "fly": fly,
    "hover": hover,
    "swim": swim,
    "walk": burrowValues.reverse[walk],
  };
}

enum Burrow {
  THE_0_FT,
  THE_10_FT,
  THE_20_FT,
  THE_30_FT,
  THE_40_FT,
  THE_50_FT,
  THE_5_FT,
}

final burrowValues = EnumValues({
  "0 ft.": Burrow.THE_0_FT,
  "10 ft.": Burrow.THE_10_FT,
  "20 ft.": Burrow.THE_20_FT,
  "30 ft.": Burrow.THE_30_FT,
  "40 ft.": Burrow.THE_40_FT,
  "50 ft.": Burrow.THE_50_FT,
  "5 ft.": Burrow.THE_5_FT,
});
