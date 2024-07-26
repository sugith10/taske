import 'package:taske/features/tasks/data/datasources/local/task_local_data.dart';
import 'package:taske/features/tasks/data/models/task_model.dart';
import 'package:taske/features/tasks/domain/entities/task_entity.dart';

import '../../domain/repositories/post_repositroy.dart';
import '../datasources/remote/task_remote_data.dart';
import '../mappers/task_mapper.dart';

/// Implementation of the PostRepository interface using a remote service.
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteData _remoteData;
  final TaskLocalData _localData;
  final TaskMapper _taskMapper;
  TaskRepositoryImpl(this._remoteData, this._localData, this._taskMapper);

  /// Adds a new post using the remote service.
  @override
  Future<void> addpost(
      {required String title, required String description}) async {
    return await _remoteData.addTask({
      "title": title,
      "description": description,
    });
  }

  /// Deletes a post by ID using the remote service.
  @override
  Future<void> deletepost(int id) {
    return _remoteData.deleteTask(id);
  }

  /// Fetches all Tasks using the remote service.
  @override
  Future<List<Task>> getallpost() async {
    final List<TaskModel> list = await _remoteData.getTask();
    await _localData.storeTask(list);
    return list.map((model) => _taskMapper.toEntity(model)).toList();
  }

  /// Updates an existing post using the remote service.
  @override
  Future<void> updatepost(Task task) async {
    final TaskModel taskModel = _taskMapper.toModel(task);
    final Map<String, dynamic> data = taskModel.toJson();
    return await _remoteData.updateTask(data);
  }

  /// Fetches a single post by ID using the remote service.
  @override
  Future<List<Task>> getLocalTask() async {
    final list = await _localData.getTask();
    return list.map((model) => _taskMapper.toEntity(model)).toList();
  }
}
