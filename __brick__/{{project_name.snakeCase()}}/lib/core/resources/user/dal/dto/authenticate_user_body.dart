import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authenticate_user.body.g.dart';

@JsonSerializable()
class AuthenticateUserBody extends Equatable {
  final String email;
  final String password;

  AuthenticateUserBody({
    required String email,
    required String password,
  })  : email = email.trim(),
        password = password.trim();

  factory AuthenticateUserBody.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserBodyToJson(this);

  @override
  List<Object?> get props => [email, password];
}
