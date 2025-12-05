import 'package:dnd_helper/models/classes_info/class.dart';

class ClassesData {
  List<Class>? classes;

  ClassesData({this.classes});

  factory ClassesData.fromJson(Map<String, dynamic> json) => ClassesData(
    classes: json["classes"] == null
        ? []
        : List<Class>.from(json["classes"]!.map((x) => Class.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classes": classes == null
        ? []
        : List<dynamic>.from(classes!.map((x) => x.toJson())),
  };
}
