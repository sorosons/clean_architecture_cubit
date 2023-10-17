import 'package:flutter_test/flutter_test.dart';

class Calculator {
  int add(int a, int b) {
    return a + b;
  }
}

void main() {
  test('adds two numbers', () {
    final calculator = Calculator();
    final result = calculator.add(1, 2);
    expect(result, 3);
  });
}
