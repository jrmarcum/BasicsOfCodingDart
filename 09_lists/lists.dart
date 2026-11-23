// In Dart, the growable `List` serves the same role as
// Go's slices — a dynamically-sized sequence of elements.

void main() {
  // To create an empty list with non-zero length, use
  // `List.filled`. Here we make a growable list of `String`s
  // of length 3 (initially empty string).
  var s = List<String>.filled(3, '', growable: true);
  print('emp: $s');

  // We can set and get just like with arrays.
  s[0] = 'a';
  s[1] = 'b';
  s[2] = 'c';
  print('set: $s');
  print('get: ${s[2]}');

  // `.length` returns the length of the list as expected.
  print('len: ${s.length}');

  // Dart lists support `add` to append one value, and
  // `addAll` to append multiple values.
  s.add('d');
  s.addAll(['e', 'f']);
  print('apd: $s');

  // Lists can also be copied with `List.from` or `.toList()`.
  var c = List<String>.from(s);
  print('cpy: $c');

  // Dart supports sublist extraction with `sublist(low, high)`.
  var l = s.sublist(2, 5);
  print('sl1: $l');

  // This gets elements up to (but excluding) index 5.
  l = s.sublist(0, 5);
  print('sl2: $l');

  // And this gets from (and including) index 2.
  l = s.sublist(2);
  print('sl3: $l');

  // We can declare and initialize a variable for a list
  // in a single line as well.
  var t = ['g', 'h', 'i'];
  print('dcl: $t');

  // Lists can be composed into multi-dimensional data
  // structures. The length of the inner lists can vary.
  var twoD = <List<int>>[];
  for (var i = 0; i < 3; i++) {
    var innerLen = i + 1;
    var inner = <int>[];
    for (var j = 0; j < innerLen; j++) {
      inner.add(i + j);
    }
    twoD.add(inner);
  }
  print('2d:  $twoD');
}
