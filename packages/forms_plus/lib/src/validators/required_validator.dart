import 'package:form_inputs/src/validators/validator.dart';

/// {@template required}
/// [Validator] requiring the value to not be empty.
/// {@endtemplate}
class RequiredValidator extends Validator<String, ValidationError> {
  /// {@macro required}
  const RequiredValidator([super.message = 'Value is required']);

  @override
  ValidationError? validate(String value) {
    return value.isEmpty ? ValidationError(message) : null;
  }
}
