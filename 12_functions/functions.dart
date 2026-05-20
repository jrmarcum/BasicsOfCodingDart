// Functions are central in Dart. We'll learn about
// functions with a few different examples.

// Here's a function that takes two `int`s and returns
// their sum as an `int`.
int plus(int a, int b) {
  // Dart requires explicit returns, i.e. it won't
  // automatically return the value of the last expression.
  return a + b;
}

// When you have multiple consecutive parameters of
// the same type, you must declare the type for each
// parameter in Dart.
int plusPlus(int a, int b, int c) {
  return a + b + c;
}

void main() {
  // Call a function just as you'd expect, with
  // `name(args)`.
  var res = plus(1, 2);
  print('1+2 = $res');

  res = plusPlus(1, 2, 3);
  print('1+2+3 = $res');
}
