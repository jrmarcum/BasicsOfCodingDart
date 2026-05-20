// Dart's Future.timeout() provides clean timeout semantics —
// it throws a TimeoutException if the future does not complete
// within the given duration, equivalent to Go's select with
// time.After.

import 'dart:async';

Future<void> main() async {
  // c1 completes after 2 seconds — equivalent to Go's goroutine
  // that sleeps 2s then sends "result 1".
  final c1 = Completer<String>();
  Future.delayed(const Duration(seconds: 2), () => c1.complete('result 1'));

  // Apply a 1-second timeout. Because the result takes 2s but the
  // timeout is 1s, we catch TimeoutException and print "timeout 1".
  try {
    final res = await c1.future.timeout(const Duration(seconds: 1));
    print(res);
  } on TimeoutException {
    print('timeout 1');
  }

  // c2 also completes after 2 seconds, but we allow a 3-second
  // timeout, so the receive succeeds and we print "result 2".
  final c2 = Completer<String>();
  Future.delayed(const Duration(seconds: 2), () => c2.complete('result 2'));

  try {
    final res = await c2.future.timeout(const Duration(seconds: 3));
    print(res);
  } on TimeoutException {
    print('timeout 2');
  }
}
