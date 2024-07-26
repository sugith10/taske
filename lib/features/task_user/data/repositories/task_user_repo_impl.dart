import 'package:taske/features/task_user/domain/entities/task_user.dart';
import 'package:taske/features/task_user/domain/repositories/task_user_repository.dart';

import '../datasources/remote/user_remote_data.dart';
import '../mappers/task_user_mapper.dart';
import '../models/task_user_model.dart';

class TaskUserRepoImpl implements TaskUserRepository {
  final TaskUserRemoteData _getUserRemoteData;
  final TaskUserMapper _taskUserMapper;
  TaskUserRepoImpl(this._getUserRemoteData, this._taskUserMapper);
  @override
  Future<List<TaskUser>> getTaskUsers() async {
    try {
      final List<TaskUserModel> taskUserModelList =
          await _getUserRemoteData.getUsers();

      return taskUserModelList
          .map((model) => _taskUserMapper.toEntity(model))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
