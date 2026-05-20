// Dart has first-class enum support, making the translation from
// Go's iota-based enums straightforward. Dart enums can have
// methods and implement interfaces, so we add a `name` property
// that matches Go's Stringer interface output.

enum ServerState {
  idle,
  connected,
  error,
  retrying;

  // Dart enums already have a `name` property returning the
  // identifier as a string, which matches our desired output.
  // We override toString() so print() produces the right value.
  @override
  String toString() => name;
}

// transition emulates a server state machine, identical to Go's.
ServerState transition(ServerState s) {
  switch (s) {
    case ServerState.idle:
      return ServerState.connected;
    case ServerState.connected:
    case ServerState.retrying:
      return ServerState.idle;
    case ServerState.error:
      return ServerState.error;
  }
}

void main() {
  final ns = transition(ServerState.idle);
  print(ns);

  final ns2 = transition(ns);
  print(ns2);
}
