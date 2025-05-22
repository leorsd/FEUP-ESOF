// Import the test package and Counter class
import 'package:esof_project/custom_code/actions/convert_to_uppercase.dart';
import 'package:test/test.dart';

void main() {
  test('returns uppercase for lowercase input', () {
      expect(convertToUppercase('hello'), 'HELLO');
    });

    test('returns uppercase for mixed-case input', () {
      expect(convertToUppercase('HeLLo WoRLd'), 'HELLO WORLD');
    });

    test('returns empty string for null input', () {
      expect(convertToUppercase(null), '');
    });

    test('returns empty string for empty input', () {
      expect(convertToUppercase(''), '');
    });

    test('returns uppercase for numeric and symbol input', () {
      expect(convertToUppercase('123!@#abc'), '123!@#ABC');
    });
}
