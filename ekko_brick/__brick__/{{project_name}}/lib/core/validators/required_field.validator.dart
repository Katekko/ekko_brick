import 'package:equatable/equatable.dart';

import '../abstractions/validators/field_validator.interface.dart';

class RequiredFieldValidator<T> extends Equatable
    implements IFieldValidator<T> {
  @override
  String? validate(T? value) {
    const message = 'Required Field';
    if (value == null) return message;

    if (value is String && value.isEmpty) {
      return message;
    } else if ((value is int || value is double || value is num) &&
        (value == 0 || value == .0)) {
      return message;
    }

    return null;
  }

  @override
  List<Object?> get props => [];
}
