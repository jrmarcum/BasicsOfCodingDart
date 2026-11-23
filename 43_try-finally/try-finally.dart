// Go's `defer` ensures a function call is performed later
// in a program's execution, usually for cleanup. Dart does
// not have a `defer` keyword; the equivalent pattern is
// `try { ... } finally { ... }`, where the `finally` block
// always executes at the end of the enclosing scope.

import 'dart:io';

// Suppose we wanted to create a file, write to it, and
// then close it when we're done. Here's how to do that
// with try/finally in Dart.

void main() {
  // Immediately after getting a file object with
  // createFile, we use a finally block to ensure
  // closeFile is called — equivalent to Go's defer.
  final f = createFile('./tmp/defer.txt');
  try {
    writeFile(f);
  } finally {
    closeFile(f);
  }
}

IOSink createFile(String path) {
  print('creating');
  return File(path).openWrite();
}

void writeFile(IOSink sink) {
  print('writing');
  sink.writeln('data');
}

void closeFile(IOSink sink) {
  print('closing');
  sink.close();
}
