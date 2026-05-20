// Branching with `if` and `else` in Dart is
// straight-forward.

void main() {
  // Here's a basic example.
  if (7 % 2 == 0) {
    print('7 is even');
  } else {
    print('7 is odd');
  }

  // You can have an `if` statement without an else.
  if (8 % 4 == 0) {
    print('8 is divisible by 4');
  }

  // In Dart, you cannot declare a variable inside the
  // `if` condition as in Go, but you can declare it
  // just before and use it in all branches.
  var num = 9;
  if (num < 0) {
    print('$num is negative');
  } else if (num < 10) {
    print('$num has 1 digit');
  } else {
    print('$num has multiple digits');
  }
}

// Note that you need parentheses around conditions
// in Dart, and braces are required.
