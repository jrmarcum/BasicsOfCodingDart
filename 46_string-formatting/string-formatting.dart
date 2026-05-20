// Dart offers string formatting primarily through string
// interpolation (`'$variable'` or `'${expression}'`) and
// various methods on numbers and strings. Here are some
// examples of common string formatting tasks.

import 'dart:io';

class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);

  @override
  String toString() => 'Point(x: $x, y: $y)';
}

void main() {
  final p = Point(1, 2);

  // Print a struct-like representation of the point.
  print(p);

  // Print with field names.
  print('Point(x: ${p.x}, y: ${p.y})');

  // Print a source-code-like representation.
  print('Point(${p.x}, ${p.y})');

  // Print the type of a value using runtimeType.
  print(p.runtimeType);

  // Formatting booleans is straightforward with interpolation.
  print(true);

  // Standard base-10 integer.
  print(123);

  // Binary representation using toRadixString(2).
  print(14.toRadixString(2));

  // Character corresponding to a given integer.
  print(String.fromCharCode(33));

  // Hex encoding using toRadixString(16).
  print(456.toRadixString(16));

  // Basic decimal float formatting.
  print(78.9.toStringAsFixed(6));

  // Scientific notation.
  print(123400000.0.toStringAsExponential(6));
  print(123400000.0.toStringAsExponential(6).toUpperCase());

  // Basic string printing.
  print('"string"');

  // Double-quoted string (escaped quotes shown explicitly).
  print('"\\\"string\\\""');

  // Hex-encode a string: each byte as two hex digits.
  final hexStr = 'hex this'
      .codeUnits
      .map((b) => b.toRadixString(16).padLeft(2, '0'))
      .join();
  print(hexStr);

  // Print a representation of an object's identity (hash code).
  // Dart has no raw pointer — we use identityHashCode as an analog.
  print('0x${identityHashCode(p).toRadixString(16)}');

  // Width-controlled integer formatting (right-justified with spaces).
  print('|${12.toString().padLeft(6)}|${345.toString().padLeft(6)}|');

  // Width and precision for floats.
  print('|${1.2.toStringAsFixed(2).padLeft(6)}|${3.45.toStringAsFixed(2).padLeft(6)}|');

  // Left-justified floats.
  print('|${1.2.toStringAsFixed(2).padRight(6)}|${3.45.toStringAsFixed(2).padRight(6)}|');

  // Right-justified strings.
  print('|${'foo'.padLeft(6)}|${'b'.padLeft(6)}|');

  // Left-justified strings.
  print('|${'foo'.padRight(6)}|${'b'.padRight(6)}|');

  // Sprintf equivalent: build a string without printing it.
  final s = 'a ${'string'}';
  print(s);

  // Write to stderr — equivalent to fmt.Fprintf(os.Stderr, ...).
  stderr.writeln('an error');
}
