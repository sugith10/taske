import '../repositories/post_repositroy.dart';

/// Class responsible for deleting posts through the repository.
class DeleteTaskUseCase {
 final TaskRepository _taskRepository;

  /// Constructs a [DeleteTaskUseCase] instance with a [PostRepository].
  DeleteTaskUseCase(this._taskRepository);

  /// Deletes a post with the specified [id] using the injected [PostRepository].
  Future<void> call(int id) async {
    return await _taskRepository.deletepost(id);
  }
}
