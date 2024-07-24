import 'dart:convert';

import 'task_priority.dart';

class TaskModel {
  String title;
  String description;
  TaskPriority taskPriority;
  DateTime date;

  TaskModel({
    required this.title,
    required this.description,
    required this.taskPriority,
    required this.date,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    TaskPriority? taskPriority,
    DateTime? date,
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      taskPriority: taskPriority ?? this.taskPriority,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'taskPriority': taskPriority,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      taskPriority: map['taskPriority'] as TaskPriority,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(title: $title, description: $description, taskPriority: $taskPriority, date: $date)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.taskPriority == taskPriority &&
        other.date == date;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        taskPriority.hashCode ^
        date.hashCode;
  }
}
