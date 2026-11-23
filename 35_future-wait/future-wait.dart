// Dart's equivalent of sync.WaitGroup is Future.wait(), which
// takes a list of Futures and completes when all of them are done.
// Workers run as async functions scheduled on the event loop.

import 'dart:async';

// worker simulates an expensive task with a 1-second delay.
Future<void> worker(int id) async {
  print('Worker $id starting');
  await Future.delayed(const Duration(seconds: 1));
  print('Worker $id done');
}

Future<void> main() async {
  // Launch 5 workers concurrently and wait for all to finish.
  // Future.wait is the direct equivalent of wg.Wait() after
  // multiple wg.Go() calls.
  await Future.wait(
    List.generate(5, (i) => worker(i + 1)),
  );
}
