// A common requirement in programs is getting the number
// of seconds, milliseconds, or microseconds since the
// Unix epoch. Here's how to do it in Dart.

void main() {
  // Use DateTime.now() to get the current time.
  final now = DateTime.now();

  // millisecondsSinceEpoch and microsecondsSinceEpoch are
  // available directly. Dart does not expose nanoseconds,
  // so we use microseconds as the finest granularity.
  final secs = now.millisecondsSinceEpoch ~/ 1000;
  final micros = now.microsecondsSinceEpoch;
  print(now);

  // Milliseconds since epoch.
  final millis = now.millisecondsSinceEpoch;
  print(secs);
  print(millis);
  print(micros);

  // Convert seconds or microseconds back to a DateTime.
  print(DateTime.fromMillisecondsSinceEpoch(secs * 1000, isUtc: true));
  print(DateTime.fromMicrosecondsSinceEpoch(micros, isUtc: true));
}
