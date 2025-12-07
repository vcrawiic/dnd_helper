import 'dart:convert';
import 'package:dnd_helper/models/monsters/monsters_data.dart';

Monsters monstersFromJson(String str) => Monsters.fromJson(json.decode(str));

String monstersToJson(Monsters data) => json.encode(data.toJson());

class Monsters {
  MonstersData? data;

  Monsters({this.data});

  factory Monsters.fromJson(Map<String, dynamic> json) => Monsters(
    data: json["data"] == null ? null : MonstersData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {"data": data?.toJson()};
}
