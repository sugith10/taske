import 'package:taske/features/task_user/domain/entities/task_user.dart';

abstract interface class TaskUserRepository{
  Future<List<TaskUser>> getTaskUsers();
}