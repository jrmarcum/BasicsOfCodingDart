// Dart supports time formatting and parsing via the
// `DateTime` class and the `intl` package. For simple
// cases, `DateTime.toIso8601String()` and custom format
// strings with `DateFormat` cover most needs.
// This lesson demonstrates formatting using Dart's built-in
// ISO-8601 support and manual string building, avoiding
// external packages.

void main() {
  final p = print;

  // Format the current time as RFC 3339 / ISO 8601.
  final t = DateTime.now();
  p(t.toIso8601String());

  // Parse an RFC 3339 string.
  final t1 = DateTime.parse('2012-11-01T22:08:41+00:00');
  p(t1);

  // Format with a custom pattern using string interpolation.
  // Dart has no built-in strftime; we build the string manually.
  final hour12 = t.hour > 12 ? t.hour - 12 : (t.hour == 0 ? 12 : t.hour);
  final ampm = t.hour >= 12 ? 'PM' : 'AM';
  p('${hour12}:${t.minute.toString().padLeft(2, '0')}$ampm');

  const weekdays = [
    '', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];
  const months = [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  p('${weekdays[t.weekday]} ${months[t.month]} ${t.day.toString().padLeft(2)} '
    '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}:${t.second.toString().padLeft(2, '0')} ${t.year}');

  p(t.toIso8601String());

  // Parse a custom format: "H MM AM/PM" — here we parse manually.
  // "8 41 PM" → 20:41
  final parts = '8 41 PM'.split(' ');
  var h = int.parse(parts[0]);
  final m = int.parse(parts[1]);
  if (parts[2] == 'PM' && h != 12) h += 12;
  final t2 = DateTime.utc(0, 1, 1, h, m);
  p(t2);

  // Numeric representation using string formatting.
  p('${t.year}-${t.month.toString().padLeft(2, '0')}-${t.day.toString().padLeft(2, '0')}'
    'T${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}:${t.second.toString().padLeft(2, '0')}-00:00');

  // Demonstrate a parse error on malformed input.
  try {
    DateTime.parse('8:41PM');
    p('no error');
  } catch (e) {
    p('parsing time "8:41PM": invalid format');
  }
}
