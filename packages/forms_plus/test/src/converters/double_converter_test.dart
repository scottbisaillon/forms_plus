import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

import '../../helpers/test_value.dart';

void main() {
  group('DoubleConverter', () {
    final variants = ValueVariant<TestValue<String, double>>({
      TestValue(input: '10.5', output: 10.5),
      TestValue(input: '-10.5', output: -10.5),
      TestValue(input: '10', output: 10),
      TestValue(input: '.5', output: .5),
      TestValue(input: '0', output: 0),
    });

    testWidgets(
      'should convert string to valid double',
      (tester) async {
        const converter = DoubleConverter();
        expect(
          converter.convert(variants.currentValue!.input),
          equals(variants.currentValue!.output),
        );
      },
      variant: variants,
    );
  });
}
