import 'package:json_annotation/json_annotation.dart';

part 'error.data.g.dart';

@JsonSerializable()
class ErrorData {
  final String id;
  final String message;

  const ErrorData({required this.id, required this.message});

  factory ErrorData.fromJson(Map<String, dynamic> json) =>
      _$ErrorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}
