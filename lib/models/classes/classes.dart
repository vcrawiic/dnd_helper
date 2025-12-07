import 'dart:convert';
import 'package:dnd_helper/models/classes_info/classes_data.dart';

Classes classesFromJson(String str) => Classes.fromJson(json.decode(str));

class Classes {
  ClassesData? data;

  Classes({this.data});

  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
    data: json["data"] == null ? null : ClassesData.fromJson(json["data"]),
  );
}
