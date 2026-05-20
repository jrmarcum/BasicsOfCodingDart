// Parsing numbers from strings is a basic but common task
// in many programs; here's how to do it in Dart.

// Dart provides number parsing via double.parse(), int.parse(),
// and their tryParse() variants which return null instead of
// throwing on bad input.

void main() {
  // double.parse() parses a floating-point number.
  final f = double.parse('1.234');
  print(f);

  // int.parse() with no radix parses a base-10 integer.
  final i = int.parse('123');
  print(i);

  // int.parse() with radix 16 parses a hex-formatted number.
  // Strip the '0x' prefix before parsing.
  final d = int.parse('1c8', radix: 16);
  print(d);

  // Parse an unsigned integer (Dart int handles this natively).
  final u = int.parse('789');
  print(u);

  // A convenience parse for base-10 integers.
  final k = int.parse('135');
  print(k);

  // Parse functions throw a FormatException on bad input.
  // We catch it and print a message matching Go's error output.
  try {
    int.parse('wat');
  } on FormatException catch (e) {
    print('int.parse: parsing "wat": invalid syntax');
  }
}
