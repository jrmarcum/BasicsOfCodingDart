// Testing and benchmarking in Dart uses the `package:test` library.
// This file contains the function under test plus a demo main().
// The actual tests live in testing-and-benchmarking_test.dart.

/// Returns the smaller of two integers.
int intMin(int a, int b) => a < b ? a : b;

void main() {
  // Demonstrate the intMin function.
  print('intMin(2, -2) = ${intMin(2, -2)}');
  print('intMin(0, 1)  = ${intMin(0, 1)}');
  print('intMin(1, 0)  = ${intMin(1, 0)}');
}
