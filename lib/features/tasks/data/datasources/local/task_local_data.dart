import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:taske/core/util/app_exception.dart';
import 'package:taske/features/tasks/data/models/task_model.dart';

class TaskLocalData {
  Future<void> storeTask(List<TaskModel> taskModelList) async {
    try {
      // Store the tasks in Hive
      final box = await Hive.openBox<TaskModel>('tasks');
      await box.clear(); // Clear existing data
      await box.addAll(taskModelList); // Add all new tasks
      await box.close();
      log('Stored ${taskModelList.length} posts in Hive');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<TaskModel>> getTask() async {
    try {
      // Store the tasks in Hive
      final box = await Hive.openBox<TaskModel>('tasks');

      final List<TaskModel> list = box.values.toList();
      await box.close();
      return list;
    } catch (e) {
      log(e.toString());
      throw AppException("Failed to get tasks...");
    }
  }
}
