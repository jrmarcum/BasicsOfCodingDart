// A line filter is a common type of program that reads
// input on stdin, processes it, and then prints some
// derived result to stdout. `grep` and `sed` are common
// line filters.

// Here's an example line filter in Dart that writes a
// capitalized version of all input text. You can use this
// pattern to write your own Dart line filters.

import 'dart:io';

void main() {
  // Read stdin line by line. `stdin.readLineSync()` reads one
  // line at a time (equivalent to bufio.Scanner in Go).
  // It returns null at end of file.
  String? line;
  while ((line = stdin.readLineSync()) != null) {
    // Convert the line to uppercase and print it.
    print(line!.toUpperCase());
  }
}
