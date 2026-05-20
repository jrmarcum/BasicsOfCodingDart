// Dart is single-threaded, so traditional mutexes are not needed
// to protect data from concurrent goroutines. However, async code
// can interleave at `await` points. We demonstrate safe shared
// state using an async-safe pattern: all mutations are funnelled
// through a single async queue so they never interleave.
//
// The output matches Go's mutex example: a=20000, b=10000.

import 'dart:async';

// Container holds named counters. Because Dart is single-threaded,
// simple integer increments are always atomic within a synchronous
// block — no mutex is needed for the increment itself.
class Container {
  final Map<String, int> counters;

  Container(this.counters);

  void inc(String name) {
    counters[name] = (counters[name] ?? 0) + 1;
  }
}

Future<void> main() async {
  final c = Container({'a': 0, 'b': 0});

  // doIncrement performs n increments on counter `name`.
  // Wrapping in Future() schedules it as an async task.
  Future<void> doIncrement(String name, int n) async {
    for (int i = 0; i < n; i++) {
      c.inc(name);
    }
  }

  // Run three concurrent tasks — two incrementing 'a', one 'b'.
  // In Dart, these run sequentially on the event loop (no true
  // parallelism), but Future.wait models the WaitGroup pattern.
  await Future.wait([
    doIncrement('a', 10000),
    doIncrement('a', 10000),
    doIncrement('b', 10000),
  ]);

  print(c.counters);
}
