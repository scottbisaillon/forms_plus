import 'package:form_inputs/src/validators/double_validator.dart';
import 'package:form_inputs/src/validators/fraction_validator.dart';
import 'package:form_inputs/src/validators/hours_minutes_format_validator.dart';
import 'package:form_inputs/src/validators/positive_validator.dart';
import 'package:form_inputs/src/validators/required_validator.dart';
import 'package:form_inputs/src/validators/url_validator.dart';

/// Convenience class for accessing packaged default validators.
class Validators {
  Validators._();

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
