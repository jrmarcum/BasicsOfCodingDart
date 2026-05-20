// Sometimes we'd like our Dart programs to intelligently handle OS signals.
// For example, we might want a server to gracefully shut down when it
// receives a SIGTERM, or a tool to stop if it receives a SIGINT.
// Dart exposes Unix signals via ProcessSignal in `dart:io`.

import 'dart:io';

Future<void> main() async {
  // Set up a listener for SIGINT (Ctrl+C) and SIGTERM.
  // ProcessSignal.watch() returns a Stream that emits each time
  // the signal is received — equivalent to signal.NotifyContext in Go.
  print('awaiting signal');

  // Listen for SIGINT and SIGTERM concurrently.
  final sigintStream = ProcessSignal.sigint.watch();
  // SIGTERM is not supported on Windows; guard accordingly.
  Stream<ProcessSignal>? sigtermStream;
  if (!Platform.isWindows) {
    sigtermStream = ProcessSignal.sigterm.watch();
  }

  // Wait for whichever signal arrives first.
  ProcessSignal received;
  if (sigtermStream != null) {
    received = await Future.any([
      sigintStream.first,
      sigtermStream.first,
    ]);
  } else {
    received = await sigintStream.first;
  }

  print('');
  print('$received signal received');
  print('exiting');
}
