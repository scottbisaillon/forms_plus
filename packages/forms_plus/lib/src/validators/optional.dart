import 'package:form_inputs/form_inputs.dart';

/// {@template optional}
/// [Validator] that will skip validation if input is empty.
/// {@endtemplate}
class Optional extends Validator<String, ValidationError> {
  /// {@macro optional}
  const Optional(this.validator) : super('');

  /// List of [Validator]s.
  final Validator<String, ValidationError> validator;

  @override
  ValidationError? validate(String value) {
    return value.isEmpty ? null : validator.validate(value);
  }
}
