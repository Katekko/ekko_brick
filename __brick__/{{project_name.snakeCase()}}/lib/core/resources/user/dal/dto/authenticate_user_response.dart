import 'package:json_annotation/json_annotation.dart';

import '../../../../base/dal/data/error_model.dart';
import '../data/user_model.dart';

part 'authenticate_user_response.g.dart';

@JsonSerializable()
class AuthenticateUserResponse {
  final AuthenticateUserDataResponse? data;
  final List<ErrorModel>? errors;

  const AuthenticateUserResponse({required this.data, required this.errors})
      : assert(data != null || errors != null);

  factory AuthenticateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserResponseToJson(this);
}

@JsonSerializable()
class AuthenticateUserDataResponse {
  final UserModel user;
  final String token;
  const AuthenticateUserDataResponse({required this.user, required this.token});

  factory AuthenticateUserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserDataResponseToJson(this);
}
