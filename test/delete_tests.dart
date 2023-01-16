import 'package:flutter_test/flutter_test.dart';
import 'package:formula1/src/functions/delete_pattern.dart';
import 'package:formula1/src/functions/find_pattern_left.dart';

void main() {
  test('Delete pi',(){
    var result = deletePattern("23=2x+\\pi ","\\times 2");
    expect(result,[4,0]);
  });
  test('Delete degree',(){
    var result = deletePattern("23\\degree ","+3");
    expect(result,[8,0]);
  });
  test('Delete percent',(){
    var result = deletePattern("\\% ","");
    expect(result,[3,0]);
  });
  test('Delete percent',(){
    var result = deletePattern("\\infty ","");
    expect(result,[7,0]);
  });
}
