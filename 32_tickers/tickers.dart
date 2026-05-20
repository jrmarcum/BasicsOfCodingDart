// Dart models a repeating ticker with `Stream.periodic`, which
// emits values at a fixed interval — equivalent to Go's
// time.NewTicker. The stream can be cancelled via a
// StreamSubscription, mirroring ticker.Stop().

import 'dart:async';

Future<void> main() async {
  // Create a periodic stream that ticks every 500 ms.
  // Each tick carries the current DateTime, equivalent to Go's
  // ticker.C channel which receives time.Time values.
  final tickStream = Stream.periodic(
    const Duration(milliseconds: 500),
    (_) => DateTime.now(),
  );

  // Subscribe and print each tick timestamp.
  StreamSubscription<DateTime>? subscription;
  subscription = tickStream.listen((t) {
    print('Tick at $t');
  });

  // Stop the ticker after 1600 ms — should produce ~3 ticks.
  await Future.delayed(const Duration(milliseconds: 1600));
  await subscription.cancel();
  print('Ticker stopped');
}
