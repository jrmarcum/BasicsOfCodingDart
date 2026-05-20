// Reading and writing files are basic tasks needed for
// many Dart programs. First we'll look at some examples of
// reading files.

import 'dart:io';

// Reading files requires checking calls for errors.
// This helper will streamline our error checks below.
void check(dynamic e) {
  if (e != null) throw e;
}

void main() {
  // Perhaps the most basic file reading task is
  // slurping a file's entire contents into memory.
  final dat = File('./tmp/dat.txt').readAsStringSync();
  stdout.write(dat);

  // You'll often want more control over how and what
  // parts of a file are read. For these tasks, open a
  // RandomAccessFile to get seek and read capabilities.
  final f = File('./tmp/dat.txt').openSync();

  // Read some bytes from the beginning of the file.
  // Allow up to 5 to be read.
  final b1 = f.readSync(5);
  print('${b1.length} bytes: ${String.fromCharCodes(b1)}');

  // Seek to a known location in the file and read from there.
  final o2 = f.setPositionSync(6);
  final b2 = f.readSync(2);
  stdout.write('${b2.length} bytes @ 6: ');
  print(String.fromCharCodes(b2));

  // Read again from the same position.
  f.setPositionSync(6);
  final b3 = f.readSync(2);
  print('${b3.length} bytes @ 6: ${String.fromCharCodes(b3)}');

  // Rewind to the beginning.
  f.setPositionSync(0);

  // Peek at the first 5 bytes without advancing position.
  final b4 = f.readSync(5);
  print('5 bytes: ${String.fromCharCodes(b4)}');

  // Close the file when done.
  f.closeSync();
}
