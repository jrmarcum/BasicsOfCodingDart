// Dart supports constants of character, string, boolean,
// and numeric values using `const` and `final`.

import 'dart:math';

// `const` declares a compile-time constant value.
const String s = 'constant';

void main() {
  print(s);

  // A `const` statement can appear anywhere a `var`
  // statement can.
  const int n = 500000000;

  // Constant expressions perform arithmetic with
  // arbitrary precision.
  const double d = 3e20 / n;
  print(d);

  // An explicit cast converts the constant to an integer.
  print(d.toInt());

  // A number can be used in a context that requires a
  // specific type. Here `sin` expects a `double`.
  print(sin(n.toDouble()));
}
