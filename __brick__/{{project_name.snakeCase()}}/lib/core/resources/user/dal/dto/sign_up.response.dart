import 'package:json_annotation/json_annotation.dart';

import '../../../../base/dal/data/error.data.dart';
import '../data/user.data.dart';

part 'sign_up.response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final UserData? data;
  final List<ErrorData>? errors;
  const SignUpResponse({required this.errors, required this.data});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
