import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/src/validators/validators.dart';

void main() {
  group('Optional', () {
    test('should skip validation when input is empty', () {
      const optionalValidator = Optional(DoubleValidator());
      final error = optionalValidator.validate('');
      expect(error, isNull);
    });

    test('should validate when input is not empty', () {
      const optionalValidator = Optional(DoubleValidator());
      final error = optionalValidator.validate('fjh');
      expect(error, isA<ValidationError>());

      final noError = optionalValidator.validate('1');
      expect(noError, isNull);
    });
  });
}
