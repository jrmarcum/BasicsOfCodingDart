// Go's syscall.Exec replaces the current process image with a new one.
// Dart has no equivalent to syscall.Exec; Process.run() is used instead,
// which spawns a child process and waits for it to complete.

import 'dart:io';

Future<void> main() async {
  // Locate the `ls` binary on the PATH (Unix) or `dir` on Windows.
  // This is equivalent to exec.LookPath in Go.
  final isWindows = Platform.isWindows;
  final binary = isWindows ? 'cmd' : 'ls';
  final arguments = isWindows ? ['/c', 'dir', '/a', '/q'] : ['-a', '-l', '-h'];

  // Run the process and capture its output.
  // Note: unlike Go's syscall.Exec, this does NOT replace the current
  // process; it spawns a child and returns when it finishes.
  final result = await Process.run(binary, arguments,
      runInShell: isWindows);

  stdout.write(result.stdout);

  if (result.exitCode != 0) {
    stderr.write(result.stderr);
    exit(result.exitCode);
  }
}
