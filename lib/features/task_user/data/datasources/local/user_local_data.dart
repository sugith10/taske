import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/task_user_model.dart';

class UserLocalData {
  Future<void> storeUsers(List<TaskUserModel> taskModelList) async {
    try {
      // Store the Task Users in Hive
      final box = await Hive.openBox<TaskUserModel>('taskUsers');
      await box.clear(); // Clear existing data
      await box.addAll(taskModelList); // Add all new Task Users
      await box.close();
      log('Stored ${taskModelList.length} posts in Hive');
    } catch (e) {
      log('$e');
    }
  }

  Future<List<TaskUserModel>> getAllTaskUsers() async {
    final box = await Hive.openBox<TaskUserModel>('taskUsers');
    final List<TaskUserModel> list = box.values.toList();
    await box.close();
    return list;
  }
}
