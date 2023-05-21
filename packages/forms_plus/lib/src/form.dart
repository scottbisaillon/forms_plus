import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:meta/meta.dart';

/// {@template form}
/// A [Form] represents a group of related [BaseFormInput]s.
/// {@endtemplate}
@immutable
abstract class Form extends Equatable {
  /// {@macro form}
  const Form();

  /// All [BaseFormInput]s of this [Form].
  List<BaseFormInput<dynamic, dynamic, ValidationError>> get inputs;

  /// If all of the [BaseFormInput]s of the this [Form] are `pure`.
  bool get isPure => inputs.every((element) => element.isPure);

  /// If all of the [BaseFormInput]s of this [Form] are `valid`.
  bool get isValid => inputs.every((element) => element.isValid);

  /// Error message from the first input that is not valid.
  String? get errorMessage =>
      inputs.firstWhereOrNull((element) => element.error != null)?.errorMessage;

  @override
  List<Object?> get props => [inputs, isPure, isValid];
}
