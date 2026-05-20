// Dart uses classes to group data together to form
// records, similar to Go's structs.

// This `Person` class has `name` and `age` fields.
class Person {
  String name;
  int age;

  // Named constructor with positional parameters.
  Person(this.name, this.age);

  // Named constructor for field-by-field initialization.
  Person.named({required this.name, this.age = 0});

  @override
  String toString() => '{$name $age}';
}

// `newPerson` constructs a new Person with the given name.
Person newPerson(String name) {
  var p = Person.named(name: name);
  p.age = 42;
  return p;
}

void main() {
  // This syntax creates a new instance.
  print(Person('Bob', 20));

  // You can name the fields when initializing.
  print(Person.named(name: 'Alice', age: 30));

  // Omitted fields will be zero-valued (age defaults to 0).
  print(Person.named(name: 'Fred'));

  // Dart objects are always references; there's no `&` prefix,
  // but we can show the object directly.
  print(Person.named(name: 'Ann', age: 40));

  // It's idiomatic to encapsulate new object creation in
  // constructor functions or factory constructors.
  print(newPerson('Jon'));

  // Access fields with a dot.
  var s = Person.named(name: 'Sean', age: 50);
  print(s.name);

  // Fields are accessed through the reference directly.
  var sp = s;
  print(sp.age);

  // Objects are mutable.
  sp.age = 51;
  print(sp.age);
}
