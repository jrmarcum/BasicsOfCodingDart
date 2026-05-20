// Dart's `Timer` class (from dart:async) provides one-shot and
// repeating timers — equivalent to Go's time.NewTimer. A Timer
// can be cancelled before it fires with timer.cancel().

import 'dart:async';

Future<void> main() async {
  // Timer 1: fire after 2 seconds.
  // We use a Completer to await the timer event, mirroring
  // Go's blocking receive on timer1.C.
  final timer1Done = Completer<void>();
  Timer(const Duration(seconds: 2), () {
    print('Timer 1 fired');
    timer1Done.complete();
  });
  await timer1Done.future;

  // Timer 2: would fire after 1 second, but we cancel it first.
  // Go's timer2.Stop() returns true if the timer was stopped;
  // Dart's timer.cancel() has no return value, so we track
  // cancellation with a flag.
  bool timer2Fired = false;
  final timer2 = Timer(const Duration(seconds: 1), () {
    timer2Fired = true;
    print('Timer 2 fired');
  });

  // Cancel before it fires — equivalent to timer2.Stop().
  final wasStopped = timer2.cancel(); // cancel() returns true if pending
  if (wasStopped) {
    print('Timer 2 stopped');
  }

  // Give timer2 enough time to fire, if it ever was going to.
  await Future.delayed(const Duration(seconds: 2));

  // Suppress unused variable warning.
  assert(!timer2Fired);
}
