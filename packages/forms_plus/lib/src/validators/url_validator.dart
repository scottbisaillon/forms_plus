import 'package:forms_plus/forms_plus.dart';

/// {@template url_validator}
/// [Validator] requiring the value to be of a URL format.
/// {@endtemplate}
class UrlValidator extends Validator<String, ValidationError> {
  /// {@macro url_validator}
  const UrlValidator([super.message = 'Invalid URL']);

  static const _urlPattern =
      r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:,.;]*)?';

  @override
  ValidationError? validate(String value) {
    return RegExp(_urlPattern, caseSensitive: false).hasMatch(value)
        ? null
        : ValidationError(message);
  }
}
