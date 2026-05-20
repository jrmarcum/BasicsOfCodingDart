// Throughout program execution we often want to create data that is not
// needed after the program exits. Temporary files and directories are useful
// for this purpose since they don't pollute the file system over time.

import 'dart:io';

void main() {
  // The easiest way to create a temporary file is via
  // Directory.systemTemp.createTempSync() (for a directory) or by
  // creating a file inside systemTemp with a generated name.
  // We use createTempSync with a prefix to create a temp directory, then
  // place a file inside it — matching ioutil.TempFile behaviour.

  // Create a temporary file in the system temp directory.
  // Dart doesn't have a direct TempFile API; we create a uniquely-named
  // file inside systemTemp instead.
  final tempFile = File(
      '${Directory.systemTemp.path}${Platform.pathSeparator}sample${DateTime.now().microsecondsSinceEpoch}');
  tempFile.createSync();

  // Display the name of the temporary file.
  // On Unix-based OSes the directory will likely be `/tmp`.
  print('Temp file name: ${tempFile.path}');

  // Clean up the file after we are done.
  try {
    // Write some data to the file.
    tempFile.writeAsBytesSync([1, 2, 3, 4]);
  } finally {
    tempFile.deleteSync();
  }

  // Create a temporary directory using createTempSync with a prefix.
  // This is equivalent to ioutil.TempDir("", "sampledir") in Go.
  final tempDir =
      Directory.systemTemp.createTempSync('sampledir');
  print('Temp dir name: ${tempDir.path}');

  try {
    // Synthesise a temporary file path inside the temp directory.
    final fname = '${tempDir.path}${Platform.pathSeparator}file1';
    File(fname).writeAsBytesSync([1, 2]);
  } finally {
    tempDir.deleteSync(recursive: true);
  }
}
