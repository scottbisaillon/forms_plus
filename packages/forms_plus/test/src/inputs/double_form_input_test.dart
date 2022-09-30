import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/forms_plus.dart';

void main() {
  group('DoubleFormInput', () {
    group('constructors', () {
      group('pure', () {
        test("should create in 'pure' state with default value", () {
          const input = DoubleFormInput.pure();
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'pure' state with specified value", () {
          const input = DoubleFormInput.pure('10');
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals('10'));
        });
      });

      group('dirty', () {
        test("should create in 'impure' state with default value", () {
          const input = DoubleFormInput.dirty();
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'impure' state with specified value", () {
          const input = DoubleFormInput.dirty('10');
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals('10'));
        });
      });
    });

    group('validators', () {
      test('should inlude Double validator', () {
        const input = DoubleFormInput.pure();
        expect(input.validators, contains(Validators.double));
      });
    });
  });

  group('RequiredDoubleFormInput', () {
    group('constructors', () {
      group('pure', () {
        test("should create in 'pure' state with default value", () {
          const input = RequiredDoubleFormInput.pure();
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'pure' state with specified value", () {
          const input = RequiredDoubleFormInput.pure('10');
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals('10'));
        });
      });

      group('dirty', () {
        test("should create in 'impure' state with default value", () {
          const input = RequiredDoubleFormInput.dirty();
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'impure' state with specified value", () {
          const input = RequiredDoubleFormInput.dirty('10');
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals('10'));
        });
      });
    });

    group('validators', () {
      test('should include Required and Double validator in order', () {
        const input = RequiredDoubleFormInput.pure();
        expect(
          input.validators,
          containsAllInOrder(
            <Validator>[Validators.required, Validators.double],
          ),
        );
      });
    });
  });
}
