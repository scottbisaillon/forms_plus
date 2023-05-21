import 'package:forms_plus/src/validators/validator.dart';

/// {@template hours_minutes_format_validator}
/// [Validator] requiring the string input to be of the format HH:MM.
/// {@endtemplate}
class HoursMinutesFormatValidator extends Validator<String, ValidationError> {
  /// {@macro hours_minutes_format_validator}
  const HoursMinutesFormatValidator([super.message = '']);

  @override
  ValidationError? validate(String value) {
    final exp = RegExp(r'(\d{1,2}):{0,1}(\d{0,2}$|$)');
    final match = exp.firstMatch(value);
    if (match == null) {
      return const ValidationError('Value must be of the format HH:MM');
    } else {
      final hoursString = match.group(1);
      if (hoursString != null) {
        if (hoursString.length < 2) {
          return const ValidationError('Hours must be of the format HH');
        }

        final hours = int.parse(hoursString);
        if (hours < 0 || hours > 23) {
          return const ValidationError('Hours must be between 00 and 23');
        }
      }

      final minutesString = match.group(2);
      if (hoursString != null &&
          (minutesString == null || minutesString.isEmpty)) {
        return const ValidationError('Value must be of the format HH:MM');
      }

      if (minutesString != null && minutesString.isNotEmpty) {
        if (minutesString.length < 2) {
          return const ValidationError('Minutes must be of the format MM');
        }

        final minutes = int.parse(minutesString);
        if (minutes < 0 || minutes > 59) {
          return const ValidationError('Minutes must be between 00 and 59');
        }
      }
    }

    return null;
  }
}
