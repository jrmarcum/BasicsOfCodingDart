// Dart supports anonymous functions and closures natively.
// Anonymous functions are useful when you want to define
// a function inline without having to name it.

// This function `intSeq` returns another function, which
// we define anonymously in the body of `intSeq`. The
// returned function _closes over_ the variable `i` to
// form a closure.
int Function() intSeq() {
  var i = 0;
  return () {
    i++;
    return i;
  };
}

void main() {
  // We call `intSeq`, assigning the result (a function)
  // to `nextInt`. This function value captures its
  // own `i` value, which will be updated each time
  // we call `nextInt`.
  var nextInt = intSeq();

  // See the effect of the closure by calling `nextInt`
  // a few times.
  print(nextInt());
  print(nextInt());
  print(nextInt());

  // To confirm that the state is unique to that
  // particular function, create and test a new one.
  var newInts = intSeq();
  print(newInts());
}
