import '../../domain/entities/user.entity.dart';
import '../data/user.data.dart';

extension UserDataMapper on UserData {
  User toEntity() {
    return User(id: id, email: email);
  }
}
