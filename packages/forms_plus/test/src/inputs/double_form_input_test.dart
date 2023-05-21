import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  group('DoubleFormInput', () {
    group('constructors', () {
      group('pure', () {
        test("should create in 'pure' state with default value", () {
          final input = DoubleFormInput.pure();
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'pure' state with specified value", () {
          final input = DoubleFormInput.pure('10');
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals('10'));
        });
      });

      group('dirty', () {
        test("should create in 'impure' state with default value", () {
          final input = DoubleFormInput.dirty();
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'impure' state with specified value", () {
          final input = DoubleFormInput.dirty('10');
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals('10'));
        });
      });
    });

    group('validators', () {
      test('should inlude Double validator', () {
        final input = DoubleFormInput.pure();
        expect(input.validators, contains(Validators.double));
      });
    });
  });

  group('RequiredDoubleFormInput', () {
    group('constructors', () {
      group('pure', () {
        test("should create in 'pure' state with default value", () {
          final input = RequiredDoubleFormInput.pure();
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'pure' state with specified value", () {
          final input = RequiredDoubleFormInput.pure('10');
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals('10'));
        });
      });

      group('dirty', () {
        test("should create in 'impure' state with default value", () {
          final input = RequiredDoubleFormInput.dirty();
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'impure' state with specified value", () {
          final input = RequiredDoubleFormInput.dirty('10');
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals('10'));
        });
      });
    });

    group('validators', () {
      test('should include Required and Double validator in order', () {
        final input = RequiredDoubleFormInput.pure();
        expect(
          input.validators,
          containsAllInOrder(
            <Validator<dynamic, ValidationError>>[
              Validators.required,
              Validators.double
            ],
          ),
        );
      });
    });
  });
}
