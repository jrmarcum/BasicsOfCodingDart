// Writing files in Dart follows similar patterns to the
// ones we saw earlier for reading.

import 'dart:io';

void check(dynamic e) {
  if (e != null) throw e;
}

void main() {
  // To start, here's how to dump a string (or just bytes)
  // into a file. writeAsStringSync is equivalent to
  // ioutil.WriteFile in Go.
  File('./tmp/dat1.txt').writeAsStringSync('hello\ngo\n');

  // For more granular writes, open a file for writing.
  final f = File('./tmp/dat2.txt').openSync(mode: FileMode.write);

  // It's good practice to close the file when done.
  // We use try/finally as the equivalent of Go's defer.
  try {
    // Write byte values directly — equivalent to writing
    // []byte{115, 111, 109, 101, 10} in Go ("some\n").
    final d2 = [115, 111, 109, 101, 10];
    f.writeFromSync(d2);
    print('wrote ${d2.length} bytes');

    // Write a string directly.
    final d3 = 'writes\n';
    f.writeStringSync(d3);
    print('wrote ${d3.length} bytes');

    // Flush writes to stable storage.
    f.flushSync();

    // Write buffered content — Dart's IOSink handles buffering,
    // but RandomAccessFile.writeStringSync is synchronous.
    final d4 = 'buffered\n';
    f.writeStringSync(d4);
    print('wrote ${d4.length} bytes');

    f.flushSync();
  } finally {
    f.closeSync();
  }
}
