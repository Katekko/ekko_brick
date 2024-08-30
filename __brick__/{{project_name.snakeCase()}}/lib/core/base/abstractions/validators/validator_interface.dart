import 'field_validator.interface.dart';

abstract class IValidator<T> {
  /// Lista de validators para validarem o campo
  final List<IFieldValidator<T>> validators;
  IValidator({required this.validators});

  bool get hasError;

  /// Implemente essa função para ativar a reatividade da validação
  ///
  /// Retorna `true` para quando o campo estiver valido
  bool validate();

  /// Função utilizada para validar um valor e retornar um erro em forma de string
  ///
  /// Quando não existe erro, é retornado null
  String? validateValue(T? value) {
    for (final validator in validators) {
      final error = validator.validate(value);
      if (error != null) {
        return error;
      }
    }

    return null;
  }
}
