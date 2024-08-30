import '../../domain/entities/user.entity.dart';

extension UserMapper on User {
  Map<String, dynamic> toMap() {
    return {'id': id, 'email': email};
  }
}
