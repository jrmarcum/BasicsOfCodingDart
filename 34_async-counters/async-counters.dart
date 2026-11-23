// Go's sync/atomic provides lock-free atomic operations for shared
// counters accessed by multiple goroutines running in parallel.
// Dart is single-threaded: there is no shared memory between
// isolates and no preemptive scheduling within an isolate.
// A plain integer incremented in a loop is therefore already
// "atomic" in Dart — no special package is required.

import 'dart:async';

Future<void> main() async {
  int ops = 0;

  // Each future performs 1000 increments — equivalent to Go's
  // 50 goroutines each doing 1000 ops.Add(1) calls.
  // Because Dart is single-threaded, these run cooperatively and
  // the counter is never corrupted by a data race.
  final futures = List.generate(50, (_) async {
    for (int i = 0; i < 1000; i++) {
      ops++;
    }
  });

  await Future.wait(futures);

  // We always get exactly 50,000 — the same guarantee Go's
  // atomic gives, but enforced by Dart's single-threaded model.
  print('ops: $ops');
}
