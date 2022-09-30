import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/forms_plus.dart';

class TestForm extends Form {
  TestForm.pure({
    String input1 = '',
    String input2 = '',
    String input3 = '',
  }) : this._(
          input1: RequiredTextFormInput.pure(input1),
          input2: RequiredTextFormInput.pure(input2),
          input3: RequiredTextFormInput.pure(input3),
        );

  const TestForm._({
    required this.input1,
    required this.input2,
    required this.input3,
  });

  final FormInput<String, String> input1;
  final FormInput<String, String> input2;
  final FormInput<String, String> input3;

  TestForm updateInput1(String value) =>
      _copyWith(input1: input1.update(value: value));

  TestForm updateInput2(String value) =>
      _copyWith(input2: input2.update(value: value));

  TestForm updateInput3(String value) =>
      _copyWith(input3: input3.update(value: value));

  @override
  List<BaseFormInput<dynamic, dynamic, ValidationError>> get inputs => [
        input1,
        input2,
        input3,
      ];

  TestForm _copyWith({
    FormInput<String, String>? input1,
    FormInput<String, String>? input2,
    FormInput<String, String>? input3,
  }) {
    return TestForm._(
      input1: input1 ?? this.input1,
      input2: input2 ?? this.input2,
      input3: input3 ?? this.input3,
    );
  }
}

void main() {
  group('Form', () {
    test('should be equal', () {
      final form1 = TestForm.pure();
      final form2 = TestForm.pure();

      expect(form1, equals(form2));
    });

    test('should be pure when all inputs are pure', () {
      final form = TestForm.pure();
      expect(form.isPure, isTrue);
    });

    test('should not be pure when at least one input is not pure', () {
      final form = TestForm.pure().updateInput1('not pure');
      expect(form.isPure, isFalse);
    });

    test('should be valid when all inputs are valid', () {
      final form =
          TestForm.pure(input1: 'valid', input2: 'valid', input3: 'valid');
      expect(form.isValid, isTrue);
      expect(form.errorMessage, isNull);
    });

    test('should be invalid when at least one input is invalid', () {
      final form = TestForm.pure(
        input1: 'valid',
        input2: 'valid',
        input3: 'valid',
      ).updateInput2('');
      expect(form.isValid, isFalse);
      expect(form.errorMessage, equals('Value is required'));
    });
  });
}
