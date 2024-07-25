import '../repositories/post_repositroy.dart';

/// Class responsible for adding details to the repository.
class AddTaskUseCase {
  final TaskRepository _taskRepository;

  /// Constructs an [AddTaskUseCase] instance with a [taskRepository].
  AddTaskUseCase(this._taskRepository);

  /// Adds details to the repository using the injected [taskRepository].
  Future<void> call(
      {required String title, required String description}) async {
    return await _taskRepository.addpost(
      title: title,
      description: description,
    );
  }
}
