// Unit tests for intMin using package:test.
// Run with: dart test testing-and-benchmarking_test.dart

import 'package:test/test.dart';
import 'testing-and-benchmarking.dart';

void main() {
  // A basic test — equivalent to TestIntMinBasic in Go.
  test('IntMinBasic', () {
    final ans = intMin(2, -2);
    expect(ans, equals(-2));
  });

  // Table-driven tests — equivalent to TestIntMinTableDriven in Go.
  // Each entry is (a, b, want).
  final testCases = [
    (0, 1, 0),
    (1, 0, 0),
    (2, -2, -2),
    (0, -1, -1),
    (-1, 0, -1),
  ];

  group('IntMinTableDriven', () {
    for (final tc in testCases) {
      final (a, b, want) = tc;
      test('$a,$b', () {
        expect(intMin(a, b), equals(want));
      });
    }
  });
}
