import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../models/task_model.dart';

class TaskRemoteData {
  final baseurl = 'https://jsonplaceholder.typicode.com';

  /// Adds a new task to the remote server.

  Future<void> addTask(Map<String, dynamic> data) async {
    try {
      Uri uri = Uri.parse('$baseurl/posts');
      final response = await http.post(
        uri,
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        log('Add post statuscode == ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  /// Deletes a Task from the remote server by its [id].
  Future<void> deleteTask(int id) async {
    try {
      Uri uri = Uri.parse('$baseurl/posts/$id');
      final response = await http.delete(uri);
      log('Delete post statuscode == ${response.statusCode}');
    } catch (e) {
      log(e.toString());
    }
  }

  /// Retrieves a list of posts from the remote server.
  Future<List<TaskModel>> getTask() async {
    List<TaskModel> posts = [];
    try {
      Uri uri = Uri.parse('$baseurl/posts');
      final response = await http.get(uri);
      final List<dynamic> jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        posts = jsonData.map((json) => TaskModel.fromJson(json)).toList();
        log('Get post statuscode == ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }

    return posts;
  }

  /// Updates an existing post on the remote server using the provided [data].
  Future<void> updateTask(Map<String, dynamic> data) async {
    try {
      Uri uri = Uri.parse('$baseurl/posts/${data['id']}');
      final response = await http.put(uri, body: jsonEncode(data));
      log('Update post statuscode == ${response.statusCode}');
    } catch (e) {
      log(e.toString());
    }
  }

 
}
