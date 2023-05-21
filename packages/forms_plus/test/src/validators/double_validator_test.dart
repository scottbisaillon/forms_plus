import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  group('DoubleValidator', () {
    test('should return null when input is valid', () {
      const validator = DoubleValidator();
      final error = validator.validate('10.0');
      expect(error, isNull);
    });

    test('should return ValidationError when input is not valid', () {
      const validator = DoubleValidator();
      final error = validator.validate('not valid');
      expect(error, isA<ValidationError>());
      expect(
        error!.message,
        equals(DoubleValidator.kMustBeADoubleDefaultErrorMessage),
      );
    });
  });
}
