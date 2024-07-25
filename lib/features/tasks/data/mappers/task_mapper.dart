import 'package:taske/features/tasks/data/models/task_model.dart';
import 'package:taske/features/tasks/domain/entities/task_entity.dart';

class TaskMapper {
  Task toEntity(TaskModel model) {
    return Task(
      description: model.description,
      id: model.id,
      title: model.title,
    );
  }

  TaskModel toModel(Task entity) {
    return TaskModel(
      description: entity.description,
      id: entity.id,
      title: entity.title,
    );
  }
}
