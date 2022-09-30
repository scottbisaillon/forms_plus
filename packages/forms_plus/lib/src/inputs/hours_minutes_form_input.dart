import 'package:form_inputs/form_inputs.dart';

/// {@template hours_minutes_form_input}
/// A base implementation of [BaseFormInput] for text fields using the format
/// HH:MM.
/// {@endtemplate}
class HoursMinutesFormInput extends FormInput<String, Duration> {
  /// {@macro hours_minutes_form_input}
  const HoursMinutesFormInput.pure([super.value = ''])
      : super.pure(
          converter: const HoursMinutesConverter(),
          validators: const [
            Validators.required,
            Validators.hoursMinutesFormat
          ],
        );

  /// {@macro text_form_input}
  const HoursMinutesFormInput.dirty([super.value = ''])
      : super.dirty(
          converter: const HoursMinutesConverter(),
          validators: const [
            Validators.required,
            Validators.hoursMinutesFormat
          ],
        );
}