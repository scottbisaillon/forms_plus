import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  group('HoursMinutesFormInput', () {
    group('constructors', () {
      group('pure', () {
        test("should create in 'pure' state with default value", () {
          const input = HoursMinutesFormInput.pure();
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'pure' state with specified value", () {
          const input = HoursMinutesFormInput.pure('10:10');
          expect(input.isPure, isTrue);
          expect(input.inputValue, equals('10:10'));
        });
      });

      group('dirty', () {
        test("should create in 'impure' state with default value", () {
          const input = HoursMinutesFormInput.dirty();
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals(''));
        });

        test("should create in 'impure' state with specified value", () {
          const input = HoursMinutesFormInput.dirty('10:10');
          expect(input.isPure, isFalse);
          expect(input.inputValue, equals('10:10'));
        });
      });
    });

    group('validators', () {
      test('should inlude Required and HoursMinutesFormat validators in order',
          () {
        const input = HoursMinutesFormInput.pure();
        expect(
          input.validators,
          containsAllInOrder(
            const <Validator>[
              Validators.required,
              Validators.hoursMinutesFormat
            ],
          ),
        );
      });
    });
  });
}
