#### Note: Dart has no built-in channels. `StreamController<T>` is the idiomatic equivalent: `sink.add()` sends a value and `stream.first` (or `await for`) receives it. A single-subscriber `StreamController` behaves like an unbuffered channel.
___
##### Run Command:
`$ dart run channels.dart`
##### Results:
`ping`
