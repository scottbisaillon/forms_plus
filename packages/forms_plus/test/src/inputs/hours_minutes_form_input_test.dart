import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/forms_plus.dart';

void main() {
  group('HoursMinutesFormInput', () {
    group('constructors', () {
      group('pure', () {
        test("should create in 'pure' state with default value", () {
          final input = HoursMinutesFormInput.pure();
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'pure' state with specified value", () {
          final input = HoursMinutesFormInput.pure('10:10');
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals('10:10'));
        });
      });

      group('dirty', () {
        test("should create in 'impure' state with default value", () {
          final input = HoursMinutesFormInput.dirty();
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'impure' state with specified value", () {
          final input = HoursMinutesFormInput.dirty('10:10');
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals('10:10'));
        });
      });
    });

    group('validators', () {
      test('should inlude Required and HoursMinutesFormat validators in order',
          () {
        final input = HoursMinutesFormInput.pure();
        expect(
          input.validators,
          containsAllInOrder(
            const <Validator<dynamic, ValidationError>>[
              Validators.required,
              Validators.hoursMinutesFormat
            ],
          ),
        );
      });
    });
  });
}
