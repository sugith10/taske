import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/task_user_model.dart';

class TaskUserRemoteData {
  final baseUrl = "https://reqres.in/api/users/";

  Future<List<TaskUserModel>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        
        log("Successfully got users");
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> userData = jsonData['data'];

        List<TaskUserModel> taskUserModelList =
            userData.map((user) => TaskUserModel.fromJson(user)).toList();

        log('Get user status code == ${response.statusCode}');

        return taskUserModelList;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      log(e.toString());
      throw Exception("Failed to load user");
    }
  }
}
