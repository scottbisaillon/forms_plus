import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/forms_plus.dart';

import '../../helpers/test_value.dart';

void main() {
  group('HoursMinutesFormatValidator', () {
    test('should return null when input is valid', () {
      const validator = HoursMinutesFormatValidator();
      final error = validator.validate('12:12');
      expect(error, isNull);
    });

    final invalidVariants = ValueVariant<TestValue<String, ValidationError>>(
      {
        TestValue(
          input: 'not valid',
          output: const ValidationError('Value must be of the format HH:MM'),
        ),
        TestValue(
          input: '1',
          output: const ValidationError('Hours must be of the format HH'),
        ),
        TestValue(
          input: '25:00',
          output: const ValidationError('Hours must be between 00 and 23'),
        ),
        TestValue(
          input: '11:',
          output: const ValidationError('Value must be of the format HH:MM'),
        ),
        TestValue(
          input: '11:1',
          output: const ValidationError('Minutes must be of the format MM'),
        ),
        TestValue(
          input: '11:60',
          output: const ValidationError('Minutes must be between 00 and 59'),
        ),
      },
    );

    testWidgets(
      'should return ValidationError when input is not valid',
      (tester) async {
        const validator = HoursMinutesFormatValidator();
        final error = validator.validate(invalidVariants.currentValue!.input);
        expect(error, isA<ValidationError>());
        expect(error, equals(invalidVariants.currentValue!.output));
      },
      variant: invalidVariants,
    );
  });
}
