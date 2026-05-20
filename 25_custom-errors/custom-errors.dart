// Dart custom errors are classes that implement the `Exception`
// interface and override `toString()` — equivalent to Go's Error()
// method on a custom error type. Type checking replaces Go's
// errors.As() using Dart's `is` operator or a direct cast.

// A custom error type — equivalent to Go's argError struct.
// The suffix "Error" or "Exception" is conventional in Dart.
class ArgError implements Exception {
  final int arg;
  final String message;

  ArgError(this.arg, this.message);

  // toString() plays the role of Go's Error() method.
  @override
  String toString() => '$arg - $message';
}

(int, ArgError?) f(int arg) {
  if (arg == 42) {
    return (-1, ArgError(arg, "can't work with it"));
  }
  return (arg + 3, null);
}

void main() {
  // errors.As in Go checks whether the error is of the given type.
  // In Dart we pattern-match directly since the return type is
  // already ArgError? — no separate type assertion is needed.
  final (_, err) = f(42);
  if (err != null) {
    print(err.arg);
    print(err.message);
  } else {
    print("err doesn't match ArgError");
  }
}
