// Dart has built-in support for _multiple return values_
// using records (introduced in Dart 3). This feature is
// used often to return both result and error values from
// a function.

// The `(int, int)` record type in this function signature
// shows that the function returns 2 `int`s.
(int, int) vals() {
  return (3, 7);
}

void main() {
  // Here we use the 2 different return values from the
  // call with record destructuring.
  var (a, b) = vals();
  print(a);
  print(b);

  // If you only want a subset of the returned values,
  // use the blank identifier `_`.
  var (_, c) = vals();
  print(c);
}
