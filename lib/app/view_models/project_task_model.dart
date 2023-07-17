// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:isar/isar.dart';

class ProjectTaskModel {
  Id id = Isar.autoIncrement;
  String name;
  int duration;
  ProjectTaskModel({
    required this.id,
    required this.name,
    required this.duration,
  });
}
