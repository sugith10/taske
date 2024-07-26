import 'package:hive_flutter/hive_flutter.dart';

part 'task_user_model.g.dart';

@HiveType(typeId: 1)
class TaskUserModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String firstName;

  @HiveField(3)
  final String lastName;

  @HiveField(4)
  final String avatar;

  TaskUserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory TaskUserModel.fromJson(Map<String, dynamic> json) {
    return TaskUserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }

  @override
  String toString() {
    return 'TaskUserModel{id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar}';
  }
}