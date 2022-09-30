class TestValue<I, O> {
  TestValue({required this.input, required this.output});

  final I input;
  final O output;

  @override
  String toString() => "'${input.toString()}'";
}
