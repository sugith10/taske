import '../entities/task_entity.dart';

/// Repository interface for handling post-related operations.
abstract interface class TaskRepository {
  /// Fetches all posts.
  Future<List<Task>> getallpost();

  /// Fetches a single post by ID.
  Future<List<Task>> getLocalTask();

  /// Adds a new post.
  Future<void> addpost({required String title, required String description});

  /// Updates an existing post.
  Future<void> updatepost(Task task);

  /// Deletes a post by ID.
  Future<void> deletepost(int id);
}
