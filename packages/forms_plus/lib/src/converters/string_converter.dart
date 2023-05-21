import 'package:form_inputs/src/converters/converter.dart';

/// {@template string_converter}
/// Converts a string => string.
/// {@endtemplate}
class StringConverter with Converter<String, String> {
  /// {@macro string_converter}
  const StringConverter();

  @override
  String convert(String value) => value;
}
