import 'package:flutter_test/flutter_test.dart';
import 'package:formula1/src/functions/find_pattern_right.dart';

void main() {
  test('Test findPatternRight function with \\frac{\\phantom{1}', () {
    var equationL = 'equationL';
    var equationR = '\\frac{\\phantom{1}';
    var expected = 17;
    var result = findPatternRight(equationL, equationR);
    expect(result, expected);
  });

  test('Test findPatternRight function with \\infty', () {
    var equationL = 'equationL';
    var equationR = '\\infty';
    var expected = 6;
    var result = findPatternRight(equationL, equationR);
    expect(result, expected);
  });

  test('Test findPatternRight function with \\int_{', () {
    var equationL = 'equationL';
    var equationR = '\\int_{';
    var expected = 6;
    var result = findPatternRight(equationL, equationR);
    expect(result, expected);
  });

  test('Test findPatternRight function with }^{', () {
    var equationL = 'equationL';
    var equationR = '}^{';
    var expected = 3;
    var result = findPatternRight(equationL, equationR);
    expect(result, expected);
  });

  test('Test findPatternRight function with ^{', () {
    var equationL = 'equationL';
    var equationR = '^{';
    var expected = 2;
    var result = findPatternRight(equationL, equationR);
    expect(result, expected);
  });

  test('Test findPatternRight function with \\phantom{1}}{\\phantom{1}', () {
    var equationL = 'equationL';
    var equationR = '\\phantom{1}}{\\phantom{1}';
    var expected = 24;
    var result = findPatternRight(equationL, equationR);
    expect(result, expected);
  });

  test('Test findPatternRight function with \\phantom{1}}', () {
    var equationL = 'equationL';
    var equationR = '\\phantom{1}}';
    var expected = 12;
    var result = findPatternRight(equationL, equationR);
    expect(result, expected);
  });
}