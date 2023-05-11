import 'package:flutter/cupertino.dart';

import 'validators/validator.interface.dart';

abstract class IField<T> extends IValidator<T> {
  set value(T? val);
  T? get value;
  Stream<String?> get errorStream;
  late final TextEditingController controller;

  IField({required super.validators, required this.controller});

  void onChange(String val);
  void Function(T? val)? onChangeCallback;
  void clearError();
  void dispose();

  @override
  bool operator ==(Object other) {
    if (runtimeType == other.runtimeType) {
      var obj = other as IField;
      if (obj.value != other.value) return false;
      if (validators.length != other.validators.length) return false;
      for (var val1 in validators) {
        final hasThisValidator = other.validators.any((e) => e == val1);
        if (!hasThisValidator) return false;
      }

      return true;
    }

    return false;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}
