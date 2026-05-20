// Switch statements express conditionals across many
// branches.

void main() {
  // Here's a basic `switch`.
  var i = 2;
  // Use stdout.write for print-without-newline equivalent.
  // dart:io stdout is available but we can build the string directly.
  var iStr = '';
  switch (i) {
    case 1:
      iStr = 'one';
      break;
    case 2:
      iStr = 'two';
      break;
    case 3:
      iStr = 'three';
      break;
  }
  print('Write $i as $iStr');

  // You can use multiple values in a single `case` by
  // listing them in a list and checking with `||`, or
  // using Dart 3 pattern matching with `||` patterns.
  var now = DateTime.now();
  switch (now.weekday) {
    case DateTime.saturday:
    case DateTime.sunday:
      print("It's the weekend");
      break;
    default:
      print("It's a weekday");
  }

  // `switch` without an expression is an alternate way
  // to express if/else logic using `true` as the switch value.
  var t = DateTime.now();
  switch (true) {
    case true when t.hour < 12:
      print("It's before noon");
      break;
    default:
      print("It's after noon");
  }

  // A type check uses `is` in Dart. We can mimic a type
  // switch with a series of `is` checks.
  void whatAmI(Object obj) {
    if (obj is bool) {
      print("I'm a bool");
    } else if (obj is int) {
      print("I'm an int");
    } else {
      print("Don't know type ${obj.runtimeType}");
    }
  }

  whatAmI(true);
  whatAmI(1);
  whatAmI('hey');
}
