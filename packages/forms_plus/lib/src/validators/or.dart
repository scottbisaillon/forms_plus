import 'package:forms_plus/forms_plus.dart';

/// {@template or}
/// [Validator] requiring a least one of [validators] to evaluate to null.
/// {@endtemplate}
class Or extends Validator<String, ValidationError> {
  /// {@macro or}
  Or({required this.validators, required String message}) : super(message);

  /// List of [Validator]s.
  final List<Validator<String, ValidationError>> validators;

  @override
  ValidationError? validate(String value) {
    for (final validator in validators) {
      if (validator.validate(value) == null) {
        return null;
      }
    }
    return ValidationError(message);
  }
}
