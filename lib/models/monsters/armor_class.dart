import 'package:dnd_helper/models/monsters/enum_values.dart';

class ArmorClass {
  Type? type;
  int? value;
  dynamic desc;

  ArmorClass({this.type, this.value, this.desc});

  factory ArmorClass.fromJson(Map<String, dynamic> json) => ArmorClass(
    type: typeValues.map[json["type"]]!,
    value: json["value"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "value": value,
    "desc": desc,
  };
}

enum Type { DEX, NATURAL }

final typeValues = EnumValues({"dex": Type.DEX, "natural": Type.NATURAL});
