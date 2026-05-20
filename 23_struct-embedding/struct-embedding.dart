// Dart supports composition but not direct struct embedding like Go.
// We model Go's embedding using a class that holds a `base` instance
// and delegates the `describe()` method. This achieves the same
// behaviour: fields and methods of the embedded type are accessible
// on the outer type, and the outer type satisfies the same interface.

// The base class — equivalent to Go's `base` struct.
class Base {
  final int num;

  Base(this.num);

  String describe() => 'base with num=$num';
}

// Container "embeds" Base by holding it as a named field and
// forwarding the describe() method. This is Dart's equivalent
// of Go's anonymous field embedding.
class Container implements Describer {
  final Base base;
  final String str;

  Container({required this.base, required this.str});

  // Expose `num` directly, mirroring Go's co.num shorthand.
  int get num => base.num;

  // Delegate to base — mirrors Go's promoted method.
  @override
  String describe() => base.describe();
}

// Interface equivalent to Go's `describer` interface.
abstract interface class Describer {
  String describe();
}

void main() {
  final co = Container(
    base: Base(1),
    str: 'some name',
  );

  // Access num directly on co, mirroring co.num in Go.
  print('co={num: ${co.num}, str: ${co.str}}');

  // Access via the embedded field name, mirroring co.base.num.
  print('also num: ${co.base.num}');

  // Call describe() promoted from base.
  print('describe: ${co.describe()}');

  // Container implements Describer because it has describe().
  Describer d = co;
  print('describer: ${d.describe()}');
}
