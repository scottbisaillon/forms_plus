/// {@template converter}
/// Converts value of type [I] to type [O].
/// {@endtemplate}
mixin Converter<I, O> {
  /// {@macro converter}
  O convert(I value);
}
