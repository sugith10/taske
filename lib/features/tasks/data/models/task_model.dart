import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
  });

  // Factory constructor to create an instance from JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['body'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': description};
  }
}