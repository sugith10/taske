import 'package:taske/features/tasks/domain/entities/task_entity.dart';
import 'package:taske/features/tasks/domain/repositories/post_repositroy.dart';

/// Class responsible for fetching details of a single post through the repository.
class GetLocalTaskUseCase {
  final TaskRepository _taskRepository;

  /// Constructs a [GetLocalTaskUseCase] instance with a [TaskRepository].
  GetLocalTaskUseCase(this._taskRepository);

  /// Executes the operation to fetch a single post by [id] using the injected [TaskRepository].
  Future<List<Task>> call() async {
    return await _taskRepository.getLocalTask();
  }
}
