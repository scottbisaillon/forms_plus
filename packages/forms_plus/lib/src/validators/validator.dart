import 'package:equatable/equatable.dart';

/// {@template validation_error}
/// A model representing an error produced by validating an input.
/// {@endtemplate}
class ValidationError extends Equatable {
  /// {@macro validation_error}
  const ValidationError(this.message);

  /// The message associated with this [ValidationError].
  final String message;

  @override
  List<Object?> get props => [message];
}

/// {@template validator}
/// A rule used to determine if an input is valid.
/// {@endtemplate}
abstract class Validator<I, E extends ValidationError> {
  /// {@macro validator}
  const Validator(this.message);

  /// An optional message associated with this [Validator].
  final String message;

  /// Returns either a [ValidationError] or the original [value].
  E? validate(I value);
}
