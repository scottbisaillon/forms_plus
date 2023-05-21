import 'package:forms_plus/src/validators/double_validator.dart';
import 'package:forms_plus/src/validators/fraction_validator.dart';
import 'package:forms_plus/src/validators/hours_minutes_format_validator.dart';
import 'package:forms_plus/src/validators/positive_validator.dart';
import 'package:forms_plus/src/validators/required_validator.dart';
import 'package:forms_plus/src/validators/url_validator.dart';

/// Convenience class for accessing packaged default validators.
abstract class Validators {
  /// {@macro required}
  static const required = RequiredValidator();

  /// {@macro url_validator}
  static const url = UrlValidator();

  /// {@macro double_validator}
  static const double = DoubleValidator();

  /// {@macro positive_validator}
  static const positive = PositiveValidator();

  /// {@macro fraction_validator}
  static const fraction = FractionValidator();

  /// {@macro hours_minutes_format_validator}
  static const hoursMinutesFormat = HoursMinutesFormatValidator();
}
