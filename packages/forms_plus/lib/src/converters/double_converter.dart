import 'package:forms_plus/src/converters/converter.dart';

/// {@template double_converter}
/// Converts a string to a double.
/// {@endtemplate}
class DoubleConverter implements Converter<String, double> {
  /// {@macro double_converter}
  const DoubleConverter();

  @override
  double convert(String value) => double.parse(value);
}
