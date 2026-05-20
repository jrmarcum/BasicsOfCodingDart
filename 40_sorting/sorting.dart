// Dart's List class has a built-in sort() method — equivalent to
// Go's sort.Strings() and sort.Ints(). Sorting is in-place, just
// like Go. Dart also provides the ability to check whether a list
// is already sorted.

void main() {
  // Sort a list of strings — equivalent to sort.Strings(strs).
  // sort() with no argument uses the natural ordering (< operator).
  final strs = ['c', 'a', 'b'];
  strs.sort();
  print('Strings: $strs');

  // Sort a list of ints — equivalent to sort.Ints(ints).
  final ints = [7, 2, 4];
  ints.sort();
  print('Ints:    $ints');

  // Check whether the list is sorted — equivalent to
  // sort.IntsAreSorted(ints). We compare adjacent elements.
  bool isSorted = true;
  for (int i = 0; i < ints.length - 1; i++) {
    if (ints[i] > ints[i + 1]) {
      isSorted = false;
      break;
    }
  }
  print('Sorted:  $isSorted');
}
