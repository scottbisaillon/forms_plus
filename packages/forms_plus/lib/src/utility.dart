import 'package:form_inputs/src/validators/validator.dart';

/// Iterable extension methods
extension IterableX<I, O, E extends ValidationError>
    on Iterable<Validator<I, E>> {
  /// Returns the first [ValidationError] ecountered,
  /// or else will return null.
  E? firstError(
    I value,
  ) {
    for (final validator in this) {
      final result = validator.validate(value);
      if (result is E) {
        return result;
      }
    }
    return null;
  }
}
