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

/// {@template double_converter_nullable}
/// Converts a string to an optional double.
/// {@endtemplate}
class DoubleConverterNullable implements Converter<String, double?> {
  /// {@macro double_converter_nullable}
  const DoubleConverterNullable();

  @override
  double? convert(String value) => double.tryParse(value);
}
