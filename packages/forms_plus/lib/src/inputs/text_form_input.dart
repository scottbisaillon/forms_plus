import 'package:forms_plus/forms_plus.dart';

/// {@template text_form_input}
/// A base implementation of [BaseFormInput] for simple text fields.
/// {@endtemplate}
class TextFormInput extends FormInput<String, String> {
  /// {@macro text_form_input}
  TextFormInput.pure([super.value = ''])
      : super.pure(
          sanitizer: Sanitizers.string,
          converter: const StringConverter(),
          validators: const [],
        );

  /// {@macro text_form_input}
  TextFormInput.dirty([super.value = ''])
      : super.dirty(
          sanitizer: Sanitizers.string,
          converter: const StringConverter(),
          validators: const [],
        );
}

/// {@template required_text_form_input}
/// An extension of [TextFormInput] with the [Validators.required] validator.
/// {@endtemplate}
class RequiredTextFormInput extends TextFormInput {
  /// {@macro required_text_form_input}
  RequiredTextFormInput.pure([super.value = '']) : super.pure();

  /// {@macro required_text_form_input}
  RequiredTextFormInput.dirty([super.value = '']) : super.dirty();

  @override
  List<Validator<String, ValidationError>> get validators =>
      const [Validators.required];
}
