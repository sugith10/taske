import '../entities/task_entity.dart';
import '../repositories/post_repositroy.dart';

/// Class responsible for updating posts through the repository.
class UpdateTaskUseCase {
  final TaskRepository _taskRepository;

  /// Constructs an [UpdateTaskUseCase] instance with a [PostRepository].
  UpdateTaskUseCase(this._taskRepository);

  /// Updates a post using the injected [PostRepository].
  Future<void> call(Task task) async {
    return await _taskRepository.updatepost(task);
  }
}
