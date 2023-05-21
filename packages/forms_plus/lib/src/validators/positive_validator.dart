import 'package:form_inputs/src/validators/validator.dart';

/// {@template positive_validator}
/// [Validator] that requires the input to be positive.
/// {@endtemplate}
class PositiveValidator extends Validator<String, ValidationError> {
  /// {@macro positive_validator}
  const PositiveValidator([
    super.message = kPositiveDefaultErrorMessage,
  ]);

  /// Default error message for the [PositiveValidator].
  static const kPositiveDefaultErrorMessage = 'Value must be positive';

  @override
  ValidationError? validate(String value) {
    return value.startsWith('-') ? ValidationError(message) : null;
  }
}
