// Variadic functions can be called with any number of trailing arguments.
// In Dart, variadic functions are expressed by accepting a `List` parameter.

// Here's a function that will take an arbitrary number
// of `int`s as arguments.
void sum(List<int> nums) {
  print('$nums ');
  var total = 0;
  for (var num in nums) {
    total += num;
  }
  print(total);
}

void main() {
  // Variadic functions are called by passing a list.
  sum([1, 2]);
  sum([1, 2, 3]);

  // If you already have multiple args in a list,
  // pass it directly to the function.
  var nums = [1, 2, 3, 4];
  sum(nums);
}
