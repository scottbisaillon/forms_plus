import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/forms_plus.dart';

void main() {
  group('StringConverter', () {
    test('should convert string to valid string', () {
      const converter = StringConverter();
      expect(converter.convert('10.5'), equals('10.5'));
    });
  });
}
