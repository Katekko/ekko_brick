import '../../domain/models/user.model.dart';
import '../data/user.data.dart';

abstract class UserMapper {
  static UserModel toModel(UserData data) {
    return UserModel(id: data.id, email: data.email);
  }

  static Map<String, dynamic> toJson(UserModel model) {
    return {'id': model.id, 'email': model.email};
  }
}
