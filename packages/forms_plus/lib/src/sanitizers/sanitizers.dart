/// Function that takes input [I] and returns a modified value.
typedef Sanitizer<I> = I Function(I value);

/// A group of [Sanitizer] functions
abstract class Sanitizers {
  /// [Sanitizer] function that simply returns the value without modification.
  static Sanitizer<String> string = (value) => value;

  /// [Sanitizer] function that removes commas.
  static Sanitizer<String> currency = (value) => value.replaceAll(',', '');
}
