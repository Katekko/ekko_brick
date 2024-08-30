import 'package:equatable/equatable.dart';

abstract class IFieldValidator<T> extends Equatable {
  String? validate(T? value);
}
