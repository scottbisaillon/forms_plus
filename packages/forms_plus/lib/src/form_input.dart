import 'package:equatable/equatable.dart';
import 'package:form_inputs/src/converters/converter.dart';
import 'package:form_inputs/src/utility.dart';
import 'package:form_inputs/src/validators/validator.dart';
import 'package:meta/meta.dart';

/// {@template form_input}
/// A basic representation of a form input.
/// [I] The input type
/// [O] The output type
/// [E] The type representing the error
/// {@endtemplate}
@immutable
abstract class BaseFormInput<I, O, E extends ValidationError>
    extends Equatable {
  const BaseFormInput._({required I value, this.isPure = true})
      : _value = value,
        super();

  /// Constructor to create a `pure` [BaseFormInput] with a given value.
  const BaseFormInput.pure(I value) : this._(value: value);

  /// Constructor to create `dirty` [BaseFormInput] with a given value.
  const BaseFormInput.dirty(I value) : this._(value: value, isPure: false);

  final I _value;

  /// The raw (non-converted) value.
  I get inputValue => _value;

  /// If this [BaseFormInput] has not been touched/modified.
  final bool isPure;

  /// List of validators for this [BaseFormInput].
  List<Validator<I, E>> get validators;

  /// The converted value of type [O] if valid, otherwise, null.
  O? get value =>
      validators.firstError(_value) == null ? convert(_value) : null;

  /// If this [BaseFormInput] is valid.
  bool get isValid => value != null;

  /// If this [BaseFormInput] is invalid.
  bool get isInvalid => !isValid;

  /// The error associated with this [BaseFormInput] if invalid.
  E? get error => validators.firstError(_value);

  /// The error message associated with this [BaseFormInput] if invalid.
  String? get errorMessage => isPure ? null : error?.message;

  /// Converts [BaseFormInput] value to expected output type [O].
  O convert(I value);

  @override
  List<Object?> get props => [inputValue, isPure];
}

/// {@template form_input}
/// An implementation of [BaseFormInput] using [ValidationError].
/// {@endtemplate}
class FormInput<I, O> extends BaseFormInput<I, O, ValidationError> {
  /// Creates a [FormInput] with the given [Converter] and list of [Validator]s
  /// in a 'pure' state.
  const FormInput.pure(
    super.value, {
    required Converter<I, O> converter,
    required this.validators,
  })  : _converter = converter,
        super.pure();

  /// Creates a [FormInput] with the given [Converter] and list of [Validator]s
  /// in a 'impure' state.
  const FormInput.dirty(
    super.value, {
    required Converter<I, O> converter,
    required this.validators,
  })  : _converter = converter,
        super.dirty();

  final Converter<I, O> _converter;

  @override
  final List<Validator<I, ValidationError>> validators;

  @override
  O convert(I value) => _converter.convert(value);

  /// Updates this [FormInput] with [value], returning a new [FormInput] in an
  /// 'impure' state.
  FormInput<I, O> update({required I value}) {
    return FormInput.dirty(
      value,
      converter: _converter,
      validators: validators,
    );
  }
}
