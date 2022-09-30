import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

import '../../helpers/test_value.dart';

void main() {
  group('UrlValidator', () {
    final validVariants = ValueVariant<TestValue<String, ValidationError?>>({
      TestValue(input: 'https://www.valid.com', output: null),
      TestValue(input: 'https://valid.com', output: null),
      TestValue(input: 'http://www.valid.com', output: null),
      TestValue(input: 'http://valid.com', output: null),
    });

    testWidgets(
      'should return null when input is valid',
      (tester) async {
        const validator = UrlValidator();
        final error = validator.validate(validVariants.currentValue!.input);
        expect(error, isNull);
      },
      variant: validVariants,
    );

    final invalidVariants = ValueVariant<TestValue<String, ValidationError?>>({
      TestValue(
        input: '',
        output: const ValidationError('Invalid URL'),
      ),
      TestValue(
        input: 'invalid url',
        output: const ValidationError('Invalid URL'),
      ),
      TestValue(
        input: 'without-protocol.com',
        output: const ValidationError('Invalid URL'),
      ),
    });

    testWidgets(
      'should return ValidationError when input is not valid',
      (tester) async {
        const validator = UrlValidator();
        final error = validator.validate(invalidVariants.currentValue!.input);
        expect(error, isA<ValidationError>());
        expect(error, equals(invalidVariants.currentValue!.output));
      },
      variant: invalidVariants,
    );
  });
}
