import '../../entities/project.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
}
