import '../../domain/entities/user_entity.dart';

extension UserMapper on User {
  Map<String, dynamic> toMap() {
    return {'id': id, 'email': email};
  }
}
