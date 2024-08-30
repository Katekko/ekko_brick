// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorData(
      id: json['id'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorDataToJson(ErrorModel instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
    };
