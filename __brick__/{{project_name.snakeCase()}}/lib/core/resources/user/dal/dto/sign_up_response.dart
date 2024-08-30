import 'package:json_annotation/json_annotation.dart';

import '../../../../base/dal/data/error_model.dart';
import '../data/user_model.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final UserModel? data;
  final List<ErrorModel>? errors;
  const SignUpResponse({required this.errors, required this.data});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
