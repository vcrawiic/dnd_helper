import 'package:dnd_helper/models/classes_info/order_info.dart';
import 'package:dnd_helper/models/classes_info/spellcasting_ability.dart';

class Spellcasting {
  List<OrderInfo>? info;
  int? level;
  SpellcastingAbility? spellcastingAbility;

  Spellcasting({this.info, this.level, this.spellcastingAbility});

  factory Spellcasting.fromJson(Map<String, dynamic> json) => Spellcasting(
    info: json["info"] == null
        ? []
        : List<OrderInfo>.from(json["info"]!.map((x) => OrderInfo.fromJson(x))),
    level: json["level"],
    spellcastingAbility: json["spellcasting_ability"] == null
        ? null
        : SpellcastingAbility.fromJson(json["spellcasting_ability"]),
  );

  Map<String, dynamic> toJson() => {
    "info": info == null
        ? []
        : List<dynamic>.from(info!.map((x) => x.toJson())),
    "level": level,
    "spellcasting_ability": spellcastingAbility?.toJson(),
  };
}
