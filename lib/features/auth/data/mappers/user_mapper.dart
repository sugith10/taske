import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class UserMapper {
  User toEntity(UserModel model) {
    return User(
      id: model.id,
      token: model.token,
    );
  }
}
