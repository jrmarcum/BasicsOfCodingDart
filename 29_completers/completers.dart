// Go's select statement waits on multiple channel operations and
// handles whichever is ready first. In Dart we model this with
// Completers (one-shot futures) and a merged stream that yields
// values in arrival order — whichever future fires first is
// handled first, just like Go's select.

import 'dart:async';

Future<void> main() async {
  // Two Completers play the role of Go's two channels.
  final c1 = Completer<String>();
  final c2 = Completer<String>();

  // Each future completes after a delay — equivalent to the two
  // goroutines sleeping and then sending on their channels.
  Future.delayed(const Duration(seconds: 1), () => c1.complete('one'));
  Future.delayed(const Duration(seconds: 2), () => c2.complete('two'));

  // Merge both futures into a single stream and read two values.
  // StreamController.broadcast lets multiple futures push into one stream.
  final merged = StreamController<String>();
  c1.future.then(merged.sink.add);
  c2.future.then((v) {
    merged.sink.add(v);
    merged.close();
  });

  // Read both values as they arrive — equivalent to Go's for/select.
  await for (final msg in merged.stream) {
    print('received $msg');
  }
}
