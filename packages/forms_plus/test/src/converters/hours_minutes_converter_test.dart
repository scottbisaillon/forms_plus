import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/forms_plus.dart';

import '../../helpers/test_value.dart';

void main() {
  group('HoursMinutesConverter', () {
    final variants = ValueVariant<TestValue<String, Duration>>({
      TestValue(
        input: '20:20',
        output: const Duration(hours: 20, minutes: 20),
      ),
      TestValue(
        input: '00:15',
        output: const Duration(minutes: 15),
      ),
      TestValue(
        input: '15:00',
        output: const Duration(hours: 15),
      ),
    });

    testWidgets(
      'should convert string of format HH:MM to valid duration',
      (tester) async {
        const converter = HoursMinutesConverter();
        expect(
          converter.convert(variants.currentValue!.input),
          equals(variants.currentValue!.output),
        );
      },
      variant: variants,
    );
  });
}
