// Dart is single-threaded but supports concurrency via Futures and
// async/await. A Future is the closest equivalent to a goroutine
// for lightweight async work. Unlike goroutines, Dart Futures run
// on an event loop rather than OS threads.

import 'dart:async';

void f(String from) {
  for (int i = 0; i < 3; i++) {
    print('$from : $i');
  }
}

Future<void> main() async {
  // Synchronous call — runs immediately, blocking until done.
  f('direct');

  // Schedule f as an async task — equivalent to Go's `go f("goroutine")`.
  // Future.microtask schedules work on the microtask queue.
  final future1 = Future(() => f('future'));

  // Anonymous async function — equivalent to `go func(...)(...)`.
  final future2 = Future(() => print('going'));

  // Wait for both futures to complete before printing "done".
  // This mirrors the time.Sleep used in Go to let goroutines finish.
  await Future.wait([future1, future2]);

  print('done');
}
