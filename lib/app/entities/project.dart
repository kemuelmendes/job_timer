import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project_task.dart';

import 'project_status.dart';

part 'project.g.dart';

@Collection()
class Project {
  Id id = Isar.autoIncrement;
  late String name;
  @enumerated
  late ProjectStatus status;
  late int estimate;
  final tasks = IsarLinks<ProjectTask>();
}
