import 'package:flutter_test/flutter_test.dart';
import 'package:formula1/src/functions/find_pattern_left.dart';

void main() {
  test('Test findPatternLeft function with \\frac{\\phantom{1}', () {
    var equation = '\\frac{\\phantom{1}';
    var expected = 17;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\infty', () {
    var equation = '\\infty';
    var expected = 6;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with }^{', () {
    var equation = '}^{';
    var expected = 3;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with ^{', () {
    var equation = '^{';
    var expected = 2;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\phantom{1}}{\\phantom{1}', () {
    var equation = '\\phantom{1}}{\\phantom{1}';
    var expected = 24;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\phantom{1}}', () {
    var equation = '\\phantom{1}}';
    var expected = 12;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with {\\phantom{1}', () {
    var equation = '{\\phantom{1}';
    var expected = 12;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with }{', () {
    var equation = '}{';
    var expected = 2;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\lim_{{', () {
    var equation = '\\lim_{{';
    var expected = 7;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with }\\to{', () {
    var equation = '}\\to{';
    var expected = 5;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\ln', () {
    var equation = '\\ln';
    var expected = 3;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\log_{', () {
    var equation = '\\log_{';
    var expected = 6;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\times', () {
    var equation = '\\times';
    var expected = 6;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\div', () {
    var equation = '\\div';
    var expected = 4;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\degree', () {
    var equation = '\\degree';
    var expected = 7;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });

  test('Test findPatternLeft function with \\%', () {
    var equation = '\\%';
    var expected = 2;
    var result = findPatternLeft(equation);
    expect(result, expected);
  });
}
