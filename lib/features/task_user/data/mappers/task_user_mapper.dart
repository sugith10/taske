import '../../domain/entities/task_user.dart';
import '../models/task_user_model.dart';

class TaskUserMapper {
  TaskUser toEntity(TaskUserModel taskUserModel) {
    return TaskUser(
      id: taskUserModel.id,
      email: taskUserModel.email,
      firstName: taskUserModel.firstName,
      lastName: taskUserModel.lastName,
      avatar: taskUserModel.avatar,
    );
  }
}
