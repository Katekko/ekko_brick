// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_user.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateUserBody _$AuthenticateUserBodyFromJson(
        Map<String, dynamic> json) =>
    AuthenticateUserBody(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthenticateUserBodyToJson(
        AuthenticateUserBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
