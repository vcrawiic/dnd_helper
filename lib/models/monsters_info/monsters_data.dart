import 'package:dnd_helper/models/monsters_info/monster.dart';

class MonstersData {
  List<Monster>? monsters;

  MonstersData({this.monsters});

  factory MonstersData.fromJson(Map<String, dynamic> json) => MonstersData(
    monsters: json["monsters"] == null
        ? []
        : List<Monster>.from(json["monsters"]!.map((x) => Monster.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "monsters": monsters == null
        ? []
        : List<dynamic>.from(monsters!.map((x) => x.toJson())),
  };
}
