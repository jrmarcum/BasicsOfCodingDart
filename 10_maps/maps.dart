// Maps are Dart's built-in associative data type
// (sometimes called _hashes_ or _dicts_ in other languages).

void main() {
  // To create an empty map, use a typed map literal or
  // the Map constructor.
  var m = <String, int>{};

  // Set key/value pairs using typical `name[key] = val`
  // syntax.
  m['k1'] = 7;
  m['k2'] = 13;

  // Printing a map with `print` will show all of
  // its key/value pairs.
  print('map: $m');

  // Get a value for a key with `name[key]`.
  var v1 = m['k1'];
  print('v1:  $v1');

  // The `.length` property returns the number of key/value
  // pairs in a map.
  print('len: ${m.length}');

  // `remove` removes key/value pairs from a map.
  m.remove('k2');
  print('map: $m');

  // To check if a key is present in a map, use
  // `containsKey`. This disambiguates between missing
  // keys and keys with zero values like `0` or `""`.
  var prs = m.containsKey('k2');
  print('prs: $prs');

  // You can also declare and initialize a new map in
  // the same line with this syntax.
  var n = <String, int>{'foo': 1, 'bar': 2};
  print('map: $n');
}
