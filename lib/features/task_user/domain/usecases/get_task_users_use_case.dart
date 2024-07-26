import '../entities/task_user.dart';
import '../repositories/task_user_repository.dart';

class GetTaskUsersUseCase {
  final TaskUserRepository _taskUserRepository;

  GetTaskUsersUseCase(this._taskUserRepository);

  Future<List<TaskUser>> call() async {
    return await _taskUserRepository.getTaskUsers();
  }
}
