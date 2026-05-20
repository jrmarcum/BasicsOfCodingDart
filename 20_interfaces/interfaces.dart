// Interfaces are named collections of method signatures.
// In Dart, interfaces are defined with `abstract class`
// and implemented with `implements`.

import 'dart:math';

// Here's a basic interface for geometric shapes.
abstract class Geometry {
  double area();
  double perim();
}

// For our example we'll implement this interface on
// `Rect` and `Circle` types.
class Rect implements Geometry {
  double width;
  double height;

  Rect(this.width, this.height);

  // To implement an interface in Dart, we implement
  // all the methods declared in the abstract class.
  @override
  double area() => width * height;

  @override
  double perim() => 2 * width + 2 * height;

  @override
  String toString() => '{$width $height}';
}

class Circle implements Geometry {
  double radius;

  Circle(this.radius);

  @override
  double area() => pi * radius * radius;

  @override
  double perim() => 2 * pi * radius;

  @override
  String toString() => '{$radius}';
}

// If a variable has an interface type, then we can call
// methods that are in the named interface. Here's a
// generic `measure` function taking advantage of this
// to work on any `Geometry`.
void measure(Geometry g) {
  print(g);
  print(g.area());
  print(g.perim());
}

void main() {
  var r = Rect(3, 4);
  var c = Circle(5);

  // The `Circle` and `Rect` types both implement the
  // `Geometry` interface so we can use instances of
  // these classes as arguments to `measure`.
  measure(r);
  measure(c);
}
