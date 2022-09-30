import 'package:form_inputs/src/validators/validator.dart';

/// {@template double_validator}
/// [Validator] requiring the value to be a valid double.
/// {@endtemplate}
class DoubleValidator extends Validator<String, ValidationError> {
  /// {@macro double_validator}
  const DoubleValidator([super.message = kMustBeADoubleDefaultErrorMessage]);

  /// Default error message for when an input must be a valid number.
  static const kMustBeADoubleDefaultErrorMessage = 'Value must be a number';

  @override
  ValidationError? validate(String value) {
    final parsed = double.tryParse(value);
    return parsed == null ? ValidationError(message) : null;
  }
}
