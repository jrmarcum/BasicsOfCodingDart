// Sometimes we'll want to sort a collection by something
// other than its natural order. For example, suppose we
// wanted to sort strings by their length instead of
// alphabetically. Here's an example of custom sorts in Dart.

// In Dart, we can sort a List with a custom comparator
// by passing a function to the sort() method. No custom
// type is required — we simply provide the comparison logic
// directly as a lambda.

void main() {
  var fruits = ['peach', 'banana', 'kiwi'];

  // Sort by string length using a custom comparator.
  // The comparator returns negative, zero, or positive to
  // indicate less-than, equal, or greater-than respectively.
  fruits.sort((a, b) => a.length.compareTo(b.length));

  print(fruits);
}
