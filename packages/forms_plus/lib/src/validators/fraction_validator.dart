import 'package:form_inputs/src/validators/validator.dart';

/// {@template fraction_validator}
/// [Validator] requiring the value to be a valid fraction.
/// {@endtemplate}
class FractionValidator extends Validator<String, ValidationError> {
  /// {@macro fraction_validator}
  const FractionValidator([
    super.message = kMustBeAFractioonDefaultErrorMessage,
  ]);

  /// Default error message for when an input must be a valid number.
  static const kMustBeAFractioonDefaultErrorMessage =
      'Value must be a valid fraction';

  @override
  ValidationError? validate(String value) {
    return RegExp(r'(\d\s){0,1}(\d+\/\d+)$').hasMatch(value)
        ? null
        : ValidationError(message);
  }
}
