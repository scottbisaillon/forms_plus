import 'package:forms_plus/forms_plus.dart';

/// An implementation of [FormInput] using a [String] as the input type and
/// [double] as the output type.
///
/// This input uses the [Validators.double] validator by default.
class DoubleFormInput extends FormInput<String, double> {
  /// {@template double_form_input_pure}
  /// Creates a [DoubleFormInput] in a 'pure' state.
  /// {@endtemplate}
  DoubleFormInput.pure([super.value = ''])
      : super.pure(
          sanitizer: Sanitizers.string,
          converter: const DoubleConverter(),
          validators: const [Validators.double],
        );

  /// {@template double_form_input_impure}
  /// Creates a [DoubleFormInput] in an 'impure' state.
  /// {@endtemplate}
  DoubleFormInput.dirty([super.value = ''])
      : super.dirty(
          sanitizer: Sanitizers.string,
          converter: const DoubleConverter(),
          validators: const [Validators.double],
        );
}

/// An extension of [DoubleFormInput]
/// with the additional [Validators.required] validator.
class RequiredDoubleFormInput extends DoubleFormInput {
  /// {@macro double_form_input_pure}
  RequiredDoubleFormInput.pure([super.value = '']) : super.pure();

  /// {@macro double_form_input_impure}
  RequiredDoubleFormInput.dirty([super.value = '']) : super.dirty();

  @override
  List<Validator<String, ValidationError>> get validators =>
      const [Validators.required, Validators.double];
}
