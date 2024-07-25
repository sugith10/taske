import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user_model.dart';

final class AuthLocalData {
  Future<void> storeUser(UserModel user) async {
    try {
      final userBox = await Hive.openBox('userData');
      await userBox.put('user', user.toMap());
      userBox.close();
      log("successfully stored");
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserModel?> getUser() async {
    try {
      final userBox = await Hive.openBox('userData');
      final user = userBox.get('user');
      userBox.close();
      if (user != null) {
        final userDataMap = Map<String, dynamic>.from(user);
        return UserModel.fromMap(userDataMap);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      final userBox = await Hive.openBox('userData');
      await userBox.clear();
      userBox.close();
    } catch (e) {
      log(e.toString());
    }
  }
}
