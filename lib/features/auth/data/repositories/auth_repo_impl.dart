import 'dart:developer';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/local/auth_local_data.dart';
import '../datasources/remote/auth_remote_data.dart';
import '../mappers/user_mapper.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteData _authData;
  final UserMapper _mapper;
  final AuthLocalData _authLocalData;

  AuthRepoImpl(this._authData, this._authLocalData, this._mapper);

  @override
  Future<User> loginUser(
      {required String email, required String password}) async {
    try {
      final UserModel userModel = await _authData.login(email, password);
      await _authLocalData.storeUser(userModel);
      return _mapper.toEntity(userModel);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOutUser() async {
    await _authLocalData.signOut();
    return;
  }

  @override
  Future<User> registerUser(
      {required String email, required String password}) async {
    final UserModel userModel = await _authData.register(email, password);
    return _mapper.toEntity(userModel);
  }

  @override
  Future<User?> getUser() async {
    final UserModel? userModel = await _authLocalData.getUser();
    if (userModel != null) {
      return _mapper.toEntity(userModel);
    }

    return null;
  }
}
