// `for` is Dart's primary looping construct. Here are
// some basic types of `for` loops.

void main() {
  // The most basic type, with a single condition (while loop).
  var i = 1;
  while (i <= 3) {
    print(i);
    i = i + 1;
  }

  // A classic initial/condition/after `for` loop.
  for (var j = 7; j <= 9; j++) {
    print(j);
  }

  // `for` without a condition will loop repeatedly
  // until you `break` out of the loop or `return` from
  // the enclosing function.
  while (true) {
    print('loop');
    break;
  }

  // You can also `continue` to the next iteration of
  // the loop.
  for (var n = 0; n <= 5; n++) {
    if (n % 2 == 0) {
      continue;
    }
    print(n);
  }
}
