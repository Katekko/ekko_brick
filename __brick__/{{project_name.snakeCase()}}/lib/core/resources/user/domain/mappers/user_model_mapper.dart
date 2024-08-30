import '../../domain/entities/user.entity.dart';
import '../data/user_model.dart';

extension UserDataMapper on UserModel {
  User toEntity() {
    return User(id: id, email: email);
  }
}
