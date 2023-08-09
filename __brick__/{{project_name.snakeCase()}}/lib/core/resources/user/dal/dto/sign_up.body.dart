import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up.body.g.dart';

@JsonSerializable()
class SignUpBody extends Equatable {
  final String email;
  final String password;

  const SignUpBody({required this.email, required this.password});

  factory SignUpBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpBodyToJson(this);

  @override
  List<Object?> get props => [email, password];
}
