// We often need our programs to perform operations on
// collections of data, like selecting all items that
// satisfy a given predicate or mapping all items to a new
// collection with a custom function.

// In Dart, many of these operations are built directly
// into the List and Iterable types, making collection
// manipulation concise and expressive.

// Index returns the first index of the target string t,
// or -1 if no match is found.
int index(List<String> vs, String t) {
  return vs.indexOf(t);
}

// include returns true if the target string t is in the list.
bool include(List<String> vs, String t) {
  return vs.contains(t);
}

// any returns true if one of the strings in the list
// satisfies the predicate f.
bool any(List<String> vs, bool Function(String) f) {
  return vs.any(f);
}

// all returns true if all of the strings in the list
// satisfy the predicate f.
bool all(List<String> vs, bool Function(String) f) {
  return vs.every(f);
}

// filter returns a new list containing all strings in the
// list that satisfy the predicate f.
List<String> filter(List<String> vs, bool Function(String) f) {
  return vs.where(f).toList();
}

// map returns a new list containing the results of applying
// the function f to each string in the original list.
List<String> mapList(List<String> vs, String Function(String) f) {
  return vs.map(f).toList();
}

void main() {
  final strs = ['peach', 'apple', 'pear', 'plum'];

  print(index(strs, 'pear'));

  print(include(strs, 'grape'));

  print(any(strs, (v) => v.startsWith('p')));

  print(all(strs, (v) => v.startsWith('p')));

  print(filter(strs, (v) => v.contains('e')));

  // The above examples all used anonymous functions,
  // but you can also use named functions of the correct type.
  print(mapList(strs, (v) => v.toUpperCase()));
}
