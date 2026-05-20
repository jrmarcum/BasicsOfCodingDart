// Dart supports methods defined on class types.

class Rect {
  int width;
  int height;

  Rect({required this.width, required this.height});

  // This `area` method is defined on the `Rect` class.
  // In Dart, all methods have implicit access to `this`.
  int area() {
    return width * height;
  }

  // Methods can read or mutate instance fields.
  // Here's a method that only reads fields (like a value receiver).
  int perim() {
    return 2 * width + 2 * height;
  }
}

void main() {
  var r = Rect(width: 10, height: 5);

  // Here we call the 2 methods defined for our class.
  print('area:  ${r.area()}');
  print('perim: ${r.perim()}');

  // In Dart, there are no pointer vs value receivers.
  // All method calls go through the object reference.
  var rp = r;
  print('area:  ${rp.area()}');
  print('perim: ${rp.perim()}');
}
