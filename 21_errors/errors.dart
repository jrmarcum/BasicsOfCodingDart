// In Dart, errors are communicated via exceptions using try/catch.
// Unlike Go's multiple return values, Dart throws exceptions when
// something goes wrong. Custom error types implement toString() to
// provide a meaningful message.

// A simple function that throws on the value 42.
(int, Exception?) f1(int arg) {
  if (arg == 42) {
    return (-1, Exception("can't work with 42"));
  }
  return (arg + 3, null);
}

// Custom error class — analogous to Go's argError struct.
// Implementing toString() gives us the same formatted message.
class ArgError implements Exception {
  final int arg;
  final String prob;

  ArgError(this.arg, this.prob);

  @override
  String toString() => '$arg - $prob';
}

(int, ArgError?) f2(int arg) {
  if (arg == 42) {
    return (-1, ArgError(arg, "can't work with it"));
  }
  return (arg + 3, null);
}

void main() {
  // Test f1 with both values.
  for (final i in [7, 42]) {
    final (r, e) = f1(i);
    if (e != null) {
      print('f1 failed: $e');
    } else {
      print('f1 worked: $r');
    }
  }

  // Test f2 with both values.
  for (final i in [7, 42]) {
    final (r, e) = f2(i);
    if (e != null) {
      print('f2 failed: $e');
    } else {
      print('f2 worked: $r');
    }
  }

  // Access the fields of the custom error directly — Dart is
  // statically typed so no type assertion is needed here.
  final (_, ae) = f2(42);
  if (ae != null) {
    print(ae.arg);
    print(ae.prob);
  }
}
