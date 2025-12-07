import 'package:dnd_helper/models/classes_info/proficiency.dart';

class SavingThrow {
  String? fullName;
  List<String>? desc;
  List<Proficiency>? skills;

  SavingThrow({this.fullName, this.desc, this.skills});

  factory SavingThrow.fromJson(Map<String, dynamic> json) => SavingThrow(
    fullName: json["full_name"],
    desc: json["desc"] == null
        ? []
        : List<String>.from(json["desc"]!.map((x) => x)),
    skills: json["skills"] == null
        ? []
        : List<Proficiency>.from(
            json["skills"]!.map((x) => Proficiency.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "desc": desc == null ? [] : List<dynamic>.from(desc!.map((x) => x)),
    "skills": skills == null
        ? []
        : List<dynamic>.from(skills!.map((x) => x.toJson())),
  };
}
