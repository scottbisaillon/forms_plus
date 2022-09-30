import 'package:form_inputs/src/converters/converter.dart';

/// {@template hours_minutes_converter}
/// Converts a string of format HH:MM to a [Duration].
/// {@endtemplate}
class HoursMinutesConverter with Converter<String, Duration> {
  /// {@macro hours_minutes_converter}
  const HoursMinutesConverter();

  @override
  Duration convert(String value) {
    final exp = RegExp(r'(\d{1,2}):{0,1}(\d{0,2}$|$)');
    final match = exp.firstMatch(value);

    var totalTime = 0;
    final hoursString = match!.group(1);
    if (hoursString != null) {
      final hours = int.parse(hoursString);
      totalTime += hours * 60;
    }

    final minutesString = match.group(2);
    if (minutesString != null && minutesString.isNotEmpty) {
      final minutes = int.parse(minutesString);
      totalTime += minutes;
    }

    return Duration(minutes: totalTime);
  }
}
