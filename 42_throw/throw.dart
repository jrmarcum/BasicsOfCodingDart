// A panic in Go means something went unexpectedly wrong
// and the program should fail fast. In Dart, the equivalent
// is throwing an unhandled exception, which terminates the
// program with an error message and stack trace.

import 'dart:io';

void main() {
  // We'll use throw to simulate Go's panic. An unhandled
  // exception causes the program to crash — this is the
  // only program in the series designed to do so.
  throw Exception('a problem');

  // A common use of panic in Go is to abort if a function
  // returns an error value we cannot handle. The equivalent
  // in Dart is to throw an exception when an unexpected
  // error occurs, for example when opening a file fails.
  // ignore: dead_code
  final file = File('/tmp/file');
  try {
    file.createSync();
  } catch (e) {
    throw Exception(e);
  }
}
