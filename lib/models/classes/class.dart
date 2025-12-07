import 'package:dnd_helper/models/classes_info/proficiency.dart';
import 'package:dnd_helper/models/classes_info/saving_throw.dart';
import 'package:dnd_helper/models/classes_info/spellcasting.dart';

class Class {
  String? name;
  List<Proficiency>? proficiencies;
  List<SavingThrow>? savingThrows;
  Spellcasting? spellcasting;

  Class({this.name, this.proficiencies, this.savingThrows, this.spellcasting});

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    name: json["name"],
    proficiencies: json["proficiencies"] == null
        ? []
        : List<Proficiency>.from(
            json["proficiencies"]!.map((x) => Proficiency.fromJson(x)),
          ),
    savingThrows: json["saving_throws"] == null
        ? []
        : List<SavingThrow>.from(
            json["saving_throws"]!.map((x) => SavingThrow.fromJson(x)),
          ),
    spellcasting: json["spellcasting"] == null
        ? null
        : Spellcasting.fromJson(json["spellcasting"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "proficiencies": proficiencies == null
        ? []
        : List<dynamic>.from(proficiencies!.map((x) => x.toJson())),
    "saving_throws": savingThrows == null
        ? []
        : List<dynamic>.from(savingThrows!.map((x) => x.toJson())),
    "spellcasting": spellcasting?.toJson(),
  };
}
