// Dart does not have built-in channels, but `StreamController`
// provides equivalent functionality: one side adds values
// (`sink.add`), the other reads them (`stream`). A single-value
// channel can also be modelled with a `Completer`.

import 'dart:async';

Future<void> main() async {
  // Create a StreamController — equivalent to make(chan string).
  // The stream carries String values between async tasks.
  final controller = StreamController<String>();

  // Send "ping" into the channel from an async task —
  // equivalent to `go func() { messages <- "ping" }()`.
  Future(() {
    controller.sink.add('ping');
    controller.close();
  });

  // Receive the first value from the stream — equivalent to
  // `msg := <-messages`.
  final msg = await controller.stream.first;
  print(msg);
}
