// Dart's `for-in` loop iterates over elements in a variety
// of data structures. Let's see how to use it with some
// of the data structures we've already learned.

void main() {
  // Here we use a `for` loop to sum the numbers in a list.
  var nums = [2, 3, 4];
  var sum = 0;
  for (var num in nums) {
    sum += num;
  }
  print('sum: $sum');

  // Using `asMap()` and `entries` provides both the
  // index and value for each entry, similar to Go's
  // `range` on arrays/slices.
  for (var entry in nums.asMap().entries) {
    if (entry.value == 3) {
      print('index: ${entry.key}');
    }
  }

  // `for-in` on a map iterates over keys. Use `.entries`
  // to iterate over key/value pairs.
  var kvs = {'a': 'apple', 'b': 'banana'};
  for (var entry in kvs.entries) {
    print('${entry.key} -> ${entry.value}');
  }

  // Iterate over just the keys of a map.
  for (var k in kvs.keys) {
    print('key: $k');
  }

  // Iterating over a string gives Unicode code units.
  // Here we use `runes` to get Unicode code points,
  // matching Go's rune iteration.
  var str = 'dart';
  for (var i = 0; i < str.runes.length; i++) {
    print('$i ${str.runes.elementAt(i)}');
  }
}
