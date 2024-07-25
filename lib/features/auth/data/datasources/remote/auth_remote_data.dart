import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../../core/util/app_exception.dart';
import '../../models/user_model.dart';

class AuthRemoteData {
  Future<UserModel> register(String email, String password) async {
    try {
      final Uri uri = Uri.parse("https://reqres.in/api/register");
  
      final response =
          await http.post(uri, body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.body);
      } else {
        throw AppException("User registration failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      final Uri uri = Uri.parse("https://reqres.in/api/login");

      final response =
          await http.post(uri, body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.body);
      } else {
        log(response.statusCode.toString());
        throw AppException("User not found");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  

 
}
