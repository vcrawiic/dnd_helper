import 'package:dnd_helper/models/monsters/armor_class.dart';
import 'package:dnd_helper/models/monsters/monster_size.dart';
import 'package:dnd_helper/models/monsters/monster_speed.dart';
import 'package:dnd_helper/models/monsters/senses.dart';

class Monster {
  String? name;
  String? image;
  MonsterSize? size;
  String? type;
  int? hitPoints;
  String? hitPointsRoll;
  Senses? senses;
  List<String>? damageImmunities;
  List<String>? damageResistances;
  List<String>? damageVulnerabilities;
  String? hitDice;
  MonsterSpeed? speed;
  List<ArmorClass>? armorClass;
  int? charisma;
  int? constitution;
  int? dexterity;
  int? intelligence;
  int? strength;
  int? wisdom;
  int? challengeRating;
  int? xp;

  Monster({
    this.name,
    this.image,
    this.size,
    this.type,
    this.hitPoints,
    this.hitPointsRoll,
    this.senses,
    this.damageImmunities,
    this.damageResistances,
    this.damageVulnerabilities,
    this.hitDice,
    this.speed,
    this.armorClass,
    this.charisma,
    this.constitution,
    this.dexterity,
    this.intelligence,
    this.strength,
    this.wisdom,
    this.challengeRating,
    this.xp,
  });

  factory Monster.fromJson(Map<String, dynamic> json) => Monster(
    name: json["name"],
    image: json["image"],
    size: sizeValues.map[json["size"]]!,
    type: json["type"],
    hitPoints: json["hit_points"],
    hitPointsRoll: json["hit_points_roll"],
    senses: json["senses"] == null ? null : Senses.fromJson(json["senses"]),
    damageImmunities: json["damage_immunities"] == null
        ? []
        : List<String>.from(json["damage_immunities"]!.map((x) => x)),
    damageResistances: json["damage_resistances"] == null
        ? []
        : List<String>.from(json["damage_resistances"]!.map((x) => x)),
    damageVulnerabilities: json["damage_vulnerabilities"] == null
        ? []
        : List<String>.from(json["damage_vulnerabilities"]!.map((x) => x)),
    hitDice: json["hit_dice"],
    speed: json["speed"] == null ? null : MonsterSpeed.fromJson(json["speed"]),
    armorClass: json["armor_class"] == null
        ? []
        : List<ArmorClass>.from(
            json["armor_class"]!.map((x) => ArmorClass.fromJson(x)),
          ),
    charisma: json["charisma"],
    constitution: json["constitution"],
    dexterity: json["dexterity"],
    intelligence: json["intelligence"],
    strength: json["strength"],
    wisdom: json["wisdom"],
    challengeRating: json["challenge_rating"],
    xp: json["xp"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "size": sizeValues.reverse[size],
    "type": type,
    "hit_points": hitPoints,
    "hit_points_roll": hitPointsRoll,
    "senses": senses?.toJson(),
    "damage_immunities": damageImmunities == null
        ? []
        : List<dynamic>.from(damageImmunities!.map((x) => x)),
    "damage_resistances": damageResistances == null
        ? []
        : List<dynamic>.from(damageResistances!.map((x) => x)),
    "damage_vulnerabilities": damageVulnerabilities == null
        ? []
        : List<dynamic>.from(damageVulnerabilities!.map((x) => x)),
    "hit_dice": hitDice,
    "speed": speed?.toJson(),
    "armor_class": armorClass == null
        ? []
        : List<dynamic>.from(armorClass!.map((x) => x.toJson())),
    "charisma": charisma,
    "constitution": constitution,
    "dexterity": dexterity,
    "intelligence": intelligence,
    "strength": strength,
    "wisdom": wisdom,
    "challenge_rating": challengeRating,
    "xp": xp,
  };
}
