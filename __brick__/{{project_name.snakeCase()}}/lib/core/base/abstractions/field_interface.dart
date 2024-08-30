import 'package:flutter/material.dart';
import 'validators/validator_interface.dart';

abstract class IField<T> extends IValidator<T> {
  ValueNotifier<T?> get valueNotifier;
  ValueNotifier<String?> get errorStream;
  final TextEditingController? controller;

  IField({required super.validators, this.controller});

  void onChange(dynamic val);
  void Function(T? val)? onChangeCallback;
  void clearError();
  void setError(String error);
  void dispose();
}
