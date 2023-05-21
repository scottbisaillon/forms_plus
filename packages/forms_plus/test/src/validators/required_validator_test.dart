import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/forms_plus.dart';

import '../../helpers/test_value.dart';

void main() {
  group('Required', () {
    final validVariants = ValueVariant<TestValue<String, ValidationError?>>({
      TestValue(input: 'valid', output: null),
    });

    testWidgets(
      'should return null when input is valid',
      (tester) async {
        const validator = RequiredValidator();
        final error = validator.validate(validVariants.currentValue!.input);
        expect(error, isNull);
      },
      variant: validVariants,
    );

    final invalidVariants = ValueVariant<TestValue<String, ValidationError>>(
      {
        TestValue(
          input: '',
          output: const ValidationError('Value is required'),
        ),
      },
    );

    testWidgets(
      'should return ValidationError when input is not valid',
      (tester) async {
        const validator = RequiredValidator();
        final error = validator.validate(invalidVariants.currentValue!.input);
        expect(error, isA<ValidationError>());
        expect(error, equals(invalidVariants.currentValue!.output));
      },
      variant: invalidVariants,
    );
  });
}
