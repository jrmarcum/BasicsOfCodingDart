// Dart does not support pointers. All objects are accessed
// by reference, and primitive types (int, double, bool) are
// passed by value. To simulate pointer-like mutation, we
// wrap a value in a simple holder class.

// A simple mutable wrapper to simulate a pointer to an int.
class IntHolder {
  int value;
  IntHolder(this.value);
}

// `zeroval` takes an `int` by value. Changes do not affect
// the caller's variable.
void zeroval(int ival) {
  ival = 0;
}

// `zeroref` takes an `IntHolder` object. Because objects
// are passed by reference, mutating `.value` affects the
// caller's object — simulating pointer behavior.
void zeroref(IntHolder holder) {
  holder.value = 0;
}

void main() {
  var i = IntHolder(1);
  print('initial: ${i.value}');

  zeroval(i.value);
  print('zeroval: ${i.value}');

  zeroref(i);
  print('zeroref: ${i.value}');

  // Dart has no address-of operator. We print the
  // object's identity hash code as an approximation.
  print('pointer: ${i.hashCode}');
}
