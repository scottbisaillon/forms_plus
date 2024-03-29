import 'package:forms_plus/forms_plus.dart';

/// {@template hours_minutes_form_input}
/// A base implementation of [BaseFormInput] for text fields using the format
/// HH:MM.
/// {@endtemplate}
class HoursMinutesFormInput extends FormInput<String, Duration> {
  /// {@macro hours_minutes_form_input}
  HoursMinutesFormInput.pure([super.value = ''])
      : super.pure(
          sanitizer: Sanitizers.string,
          converter: const HoursMinutesConverter(),
          validators: const [
            Validators.required,
            Validators.hoursMinutesFormat
          ],
        );

  /// {@macro text_form_input}
  HoursMinutesFormInput.dirty([super.value = ''])
      : super.dirty(
          sanitizer: Sanitizers.string,
          converter: const HoursMinutesConverter(),
          validators: const [
            Validators.required,
            Validators.hoursMinutesFormat
          ],
        );
}
