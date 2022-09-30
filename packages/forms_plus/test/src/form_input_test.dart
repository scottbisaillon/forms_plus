// ignore_for_file: prefer_const_constructors
import 'package:form_inputs/src/form_input.dart';
import 'package:form_inputs/src/validators/all_validators.dart';
import 'package:form_inputs/src/validators/validator.dart';
import 'package:test/test.dart';

class TestFormInput extends BaseFormInput<String, String, ValidationError> {
  const TestFormInput.dirty([super.value = '']) : super.dirty();
  const TestFormInput.pure([super.value = '']) : super.pure();

  @override
  String convert(String value) => value;

  @override
  List<Validator<String, ValidationError>> get validators =>
      [Validators.required];
}

void main() {
  group('FormInput', () {
    group('constructors', () {
      test('pure should creates input in [pure] state', () {
        const input = TestFormInput.pure('value');
        expect(input.isPure, isTrue);
      });

      test('dirty should creates input in [dirty] state', () {
        const input = TestFormInput.dirty('value');
        expect(input.isPure, isFalse);
      });
    });

    group('when input is valid', () {
      const value = 'valid input';

      test('[isValid] should return [true]', () {
        const input = TestFormInput.dirty(value);
        expect(input.isValid, isTrue);
        expect(input.isInvalid, isFalse);
      });

      test('[errorMessage] should be null', () {
        const input = TestFormInput.dirty(value);
        expect(input.errorMessage, isNull);
      });
    });

    group('when input is invalid', () {
      test('[isInvalid] should return [true]', () {
        const input = TestFormInput.dirty();
        expect(input.isInvalid, isTrue);
        expect(input.isValid, isFalse);
      });

      test('[error] should return ValidationError', () {
        const input = TestFormInput.dirty();
        expect(input.error, equals(ValidationError('Value is required')));
      });
    });
  });
}
