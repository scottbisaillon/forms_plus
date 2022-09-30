import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group('StringConverter', () {
    test('should convert string to valid string', () {
      const converter = StringConverter();
      expect(converter.convert('10.5'), equals('10.5'));
    });
  });
}
