// Sometimes we'd like our Dart programs to intelligently handle OS signals.
// For example, we might want a server to gracefully shut down when it
// receives a SIGTERM, or a tool to stop if it receives a SIGINT.
// Dart exposes Unix signals via ProcessSignal in `dart:io`.

import 'dart:async';
import 'dart:io';

Future<void> main() async {
  // Set up a listener for SIGINT (Ctrl+C) and SIGTERM.
  // ProcessSignal.watch() returns a Stream that emits each time
  // the signal is received — equivalent to signal.NotifyContext in Go.
  print('awaiting signal');

  // Listen for SIGINT and, where supported, SIGTERM.
  // SIGTERM is not supported on Windows; guard accordingly.
  final signals = [
    ProcessSignal.sigint,
    if (!Platform.isWindows) ProcessSignal.sigterm,
  ];

  // Complete with whichever signal arrives first.
  final done = Completer<ProcessSignal>();
  final subs = [
    for (final s in signals)
      s.watch().listen((sig) {
        if (!done.isCompleted) done.complete(sig);
      }),
  ];
  final received = await done.future;

  // Cancel every watcher so the program can exit.
  for (final sub in subs) {
    await sub.cancel();
  }

  // Print the signal using Go's names for it.
  final name = received == ProcessSignal.sigint ? 'interrupt' : 'terminated';
  print('');
  print('$name signal received');
  print('exiting');
}
