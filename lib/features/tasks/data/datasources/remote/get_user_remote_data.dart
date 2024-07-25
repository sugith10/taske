import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/task_user.dart';

class GetUserRemoteData {
  final baseUrl = "https://reqres.in/api/users/4";

  Future<TaskUser> getUser() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        log("Successfully got user");
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final userData = jsonData['data'];
        TaskUser taskUser = TaskUser.fromJson(userData);
        log('Get user status code == ${response.statusCode}');

        return taskUser;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      log(e.toString());
      throw Exception("Failed to load user");
    }
  }
}
