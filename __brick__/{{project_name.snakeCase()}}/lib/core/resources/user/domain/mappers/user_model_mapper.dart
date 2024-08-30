import '../../dal/data/user_model.dart';
import '../../domain/entities/user_entity.dart';

extension UserDataMapper on UserModel {
  User toEntity() {
    return User(id: id, email: email);
  }
}
