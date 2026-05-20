// Sometimes our Dart programs need to spawn other processes.
// The `dart:io` library's Process class provides this functionality.

import 'dart:io';

Future<void> main() async {
  // Run a simple command that prints to stdout.
  // On Windows we use 'cmd /c date /t'; on Unix we use 'date'.
  final isWindows = Platform.isWindows;

  ProcessResult dateResult;
  if (isWindows) {
    dateResult = await Process.run('cmd', ['/c', 'date', '/t'],
        runInShell: true);
  } else {
    dateResult = await Process.run('date', []);
  }

  print('> date');
  print(dateResult.stdout.toString().trim());
  print('');

  // Run a command that is expected to fail (bad flag).
  ProcessResult badResult;
  if (isWindows) {
    badResult = await Process.run('cmd', ['/c', 'date', '-x'],
        runInShell: true);
  } else {
    badResult = await Process.run('date', ['-x']);
  }

  if (badResult.exitCode != 0) {
    print('command exit rc = ${badResult.exitCode}');
  }
  print('');

  // Pipe data to a child process via stdin and read its stdout.
  // On Unix this uses grep; on Windows we use findstr.
  if (!isWindows) {
    final grepProcess =
        await Process.start('grep', ['hello']);
    grepProcess.stdin.writeln('hello grep');
    grepProcess.stdin.writeln('goodbye grep');
    await grepProcess.stdin.close();

    final grepOut = await grepProcess.stdout
        .transform(SystemEncoding().decoder)
        .join();
    await grepProcess.exitCode;

    print('> grep hello');
    print(grepOut.trim());
    print('');
  }

  // Run a shell command string directly.
  ProcessResult lsResult;
  if (isWindows) {
    lsResult = await Process.run(
        'cmd', ['/c', 'dir', '/a', '-l', '-h'],
        runInShell: true);
  } else {
    lsResult =
        await Process.run('bash', ['-c', 'ls -a -l -h']);
  }

  print('> ls -a -l -h');
  print(lsResult.stdout.toString().trim());
}
