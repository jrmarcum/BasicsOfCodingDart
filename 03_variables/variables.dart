// In Dart, variables are explicitly declared and used by
// the compiler to e.g. check type-correctness of function
// calls.

void main() {
  // `var` declares a variable with inferred type.
  var a = 'initial';
  print(a);

  // You can declare multiple variables with explicit types.
  int b = 1, c = 2;
  print('$b $c');

  // Dart will infer the type of initialized variables.
  var d = true;
  print(d);

  // Variables declared without initialization have a
  // default value of `null` in Dart. For non-nullable
  // `int`, you must provide an explicit initial value.
  int e = 0;
  print(e);

  // The `var` keyword infers the type, e.g. `String`.
  var f = 'apple';
  print(f);
}
