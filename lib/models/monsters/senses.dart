import 'package:dnd_helper/models/monsters/enum_values.dart';

class Senses {
  Blindsight? blindsight;
  Darkvision? darkvision;
  int? passivePerception;
  Blindsight? tremorsense;
  Blindsight? truesight;

  Senses({
    this.blindsight,
    this.darkvision,
    this.passivePerception,
    this.tremorsense,
    this.truesight,
  });

  factory Senses.fromJson(Map<String, dynamic> json) => Senses(
    blindsight: blindsightValues.map[json["blindsight"]]!,
    darkvision: darkvisionValues.map[json["darkvision"]]!,
    passivePerception: json["passive_perception"],
    tremorsense: blindsightValues.map[json["tremorsense"]]!,
    truesight: blindsightValues.map[json["truesight"]]!,
  );

  Map<String, dynamic> toJson() => {
    "blindsight": blindsightValues.reverse[blindsight],
    "darkvision": darkvisionValues.reverse[darkvision],
    "passive_perception": passivePerception,
    "tremorsense": blindsightValues.reverse[tremorsense],
    "truesight": blindsightValues.reverse[truesight],
  };
}

enum Blindsight { THE_10_FT, THE_120_FT, THE_30_FT, THE_60_FT }

final blindsightValues = EnumValues({
  "10 ft.": Blindsight.THE_10_FT,
  "120 ft.": Blindsight.THE_120_FT,
  "30 ft.": Blindsight.THE_30_FT,
  "60 ft.": Blindsight.THE_60_FT,
});

enum Darkvision { THE_120_FT, THE_60_FT, THE_90_FT }

final darkvisionValues = EnumValues({
  "120 ft.": Darkvision.THE_120_FT,
  "60 ft.": Darkvision.THE_60_FT,
  "90 ft.": Darkvision.THE_90_FT,
});
