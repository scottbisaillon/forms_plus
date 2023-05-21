import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  group('TextFormInput', () {
    group('constructors', () {
      group('pure', () {
        test("should create in 'pure' state with default value", () {
          final input = TextFormInput.pure();
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'pure' state with specified value", () {
          final input = TextFormInput.pure('10');
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals('10'));
        });
      });

      group('dirty', () {
        test("should create in 'impure' state with default value", () {
          final input = TextFormInput.dirty();
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'impure' state with specified value", () {
          final input = TextFormInput.dirty('10');
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals('10'));
        });
      });
    });

    group('validators', () {
      test('should be empty', () {
        final pure = TextFormInput.pure();
        expect(pure.validators, isEmpty);
      });
    });
  });

  group('RequiredTextFormInput', () {
    group('constructors', () {
      group('pure', () {
        test("should create in 'pure' state with default value", () {
          final input = RequiredTextFormInput.pure();
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'pure' state with specified value", () {
          final input = RequiredTextFormInput.pure('10');
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals('10'));
        });
      });

      group('dirty', () {
        test("should create in 'impure' state with default value", () {
          final input = RequiredTextFormInput.dirty();
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'impure' state with specified value", () {
          final input = RequiredTextFormInput.dirty('10');
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals('10'));
        });
      });
    });

    group('validators', () {
      test('should include Required', () {
        final input = RequiredDoubleFormInput.pure();
        expect(
          input.validators,
          contains(Validators.required),
        );
      });
    });
  });
}
