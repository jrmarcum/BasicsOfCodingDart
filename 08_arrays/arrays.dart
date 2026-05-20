// In Dart, a fixed-length array is represented by a
// `List` with a fixed length, similar to Go's arrays.

void main() {
  // Here we create a fixed-length list `a` that will hold exactly
  // 5 `int`s. By default the list is zero-valued (filled with 0s).
  var a = List<int>.filled(5, 0);
  print('emp: $a');

  // We can set a value at an index using the
  // `list[index] = value` syntax, and get a value with
  // `list[index]`.
  a[4] = 100;
  print('set: $a');
  print('get: ${a[4]}');

  // The `.length` property returns the length of a list.
  print('len: ${a.length}');

  // Use this syntax to declare and initialize a list
  // in one line.
  var b = [1, 2, 3, 4, 5];
  print('dcl: $b');

  // Lists are one-dimensional, but you can compose them
  // to build multi-dimensional data structures.
  var twoD = List.generate(2, (_) => List<int>.filled(3, 0));
  for (var i = 0; i < 2; i++) {
    for (var j = 0; j < 3; j++) {
      twoD[i][j] = i + j;
    }
  }
  print('2d:  $twoD');
}
