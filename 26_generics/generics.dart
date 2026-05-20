// Dart has supported generics since its early versions.
// Generic functions and classes use the same <T> syntax as many
// other languages. Dart's type inference works similarly to Go's,
// so explicit type arguments are often optional.

// A generic function that finds the first index of a value in a
// list — equivalent to Go's SlicesIndex[S ~[]E, E comparable].
// Dart's == operator works on all types by default.
int slicesIndex<E>(List<E> s, E v) {
  for (int i = 0; i < s.length; i++) {
    if (s[i] == v) return i;
  }
  return -1;
}

// A generic singly-linked list — equivalent to Go's List[T].
class _Element<T> {
  _Element<T>? next;
  final T val;
  _Element(this.val);
}

class LinkedList<T> {
  _Element<T>? _head;
  _Element<T>? _tail;

  // Push appends a value to the end of the list.
  void push(T v) {
    final e = _Element<T>(v);
    if (_tail == null) {
      _head = e;
      _tail = e;
    } else {
      _tail!.next = e;
      _tail = e;
    }
  }

  // AllElements returns all list values as a Dart List.
  List<T> allElements() {
    final result = <T>[];
    var e = _head;
    while (e != null) {
      result.add(e.val);
      e = e.next;
    }
    return result;
  }
}

void main() {
  final s = ['foo', 'bar', 'zoo'];

  // Type inference lets us call slicesIndex without explicit types.
  print('index of zoo: ${slicesIndex(s, 'zoo')}');

  // Explicit type arguments also work.
  slicesIndex<String>(s, 'zoo');

  final lst = LinkedList<int>();
  lst.push(10);
  lst.push(13);
  lst.push(23);
  print('list: ${lst.allElements()}');
}
