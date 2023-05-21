import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/forms_plus.dart';

void main() {
  group('Validator', () {
    test('should be equal', () {
      const error1 = ValidationError('message');
      const error2 = ValidationError('message');
      expect(error1, equals(error2));
    });
  });
}
