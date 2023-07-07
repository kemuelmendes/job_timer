import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/repositories/projects/project_repository.dart';

import '../../core/database/database.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl({required Database database}) : _database = database;

  @override
  Future<void> register(Project project) async {
    // final connection = await _database.openConnection();
    // await connection.writeTxn((isar) {
    //   return isar.projects.put(project);
    // });
  }
}
