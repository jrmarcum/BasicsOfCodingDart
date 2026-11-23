// Go's panic/recover mechanism stops the current function's
// execution and unwinds the stack until a deferred recover()
// call catches it. In Dart, throw/try-catch provides the same
// semantics: an uncaught throw unwinds the call stack until a
// matching catch clause handles it.

// This function throws — equivalent to Go's mayPanic() that
// calls panic("a problem").
void mayPanic() {
  throw 'a problem';
}

void main() {
  // Wrap the call in try/catch — equivalent to Go's deferred
  // recover(). Any Object can be thrown in Dart (not just
  // Exception/Error), so we catch Object to match Go's recover()
  // which can catch any panic value.
  try {
    mayPanic();

    // This line is unreachable — mayPanic() always throws.
    print('After mayPanic()');
  } catch (r) {
    // r holds the thrown value, equivalent to Go's recover()
    // return value.
    print('Recovered. Error:\n $r');
  }
}
