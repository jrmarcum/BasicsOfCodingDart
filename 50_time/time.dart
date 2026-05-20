// Dart offers extensive support for times and durations
// via the `DateTime` and `Duration` classes. Here are
// some examples.

void main() {
  final p = print;

  // We'll start by getting the current time.
  final now = DateTime.now();
  p(now);

  // You can build a DateTime by providing the year, month,
  // day, etc. Use DateTime.utc() to specify UTC explicitly.
  final then = DateTime.utc(2009, 11, 17, 20, 34, 58, 651, 387);
  p(then);

  // Extract the various components of the DateTime value.
  p(then.year);
  p(then.month);   // integer month (11)
  p(then.day);
  p(then.hour);
  p(then.minute);
  p(then.second);
  p(then.microsecond);
  p(then.timeZoneName);

  // The weekday — Dart uses integers (1=Monday … 7=Sunday).
  // Convert to a name to match Go's output.
  const weekdays = [
    '', 'Monday', 'Tuesday', 'Wednesday',
    'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];
  p(weekdays[then.weekday]);

  // Compare two DateTimes.
  p(then.isBefore(now));
  p(then.isAfter(now));
  p(then.isAtSameMomentAs(now));

  // Compute the Duration between two DateTimes.
  final diff = now.difference(then);
  p(diff);

  // Duration components.
  p(diff.inMicroseconds / Duration.microsecondsPerHour);
  p(diff.inMicroseconds / Duration.microsecondsPerMinute);
  p(diff.inMicroseconds / Duration.microsecondsPerSecond);
  p(diff.inMicroseconds * 1000); // nanoseconds approximation

  // Advance or rewind a DateTime by a Duration.
  p(then.add(diff));
  p(then.subtract(diff));
}
