
import 'package:taske/features/tasks/domain/entities/task_entity.dart';

import '../repositories/post_repositroy.dart';

/// Class responsible for fetching post details through the repository.
class GetAllTaskUseCase {
  final TaskRepository _taskRepository;

  /// Constructs a [GetAllTaskUseCase] instance with a [taskRepository].
  GetAllTaskUseCase(this._taskRepository);

  /// Executes the operation to fetch all posts using the injected [taskRepository].
  Future<List<Task>> call() async {
    return await _taskRepository.getallpost();
  }
}
