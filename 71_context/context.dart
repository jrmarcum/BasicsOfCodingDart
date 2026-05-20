// In Go, context.Context carries cancellation signals across API boundaries.
// Dart's async model uses Future/Stream cancellation and timeouts instead.
// Here we demonstrate equivalent timeout/cancellation behaviour using
// an HttpServer with a client disconnect detector.

import 'dart:async';
import 'dart:io';

Future<void> hello(HttpRequest req) async {
  print('server: hello handler started');

  // Detect if the client disconnects before we finish.
  bool cancelled = false;
  final clientGone = req.response.done.then((_) {}).catchError((_) {
    cancelled = true;
  });

  // Simulate work: wait up to 10 seconds, but honour client cancellation.
  final work = Future<void>.delayed(const Duration(seconds: 10));

  await Future.any([work, clientGone]);

  if (cancelled) {
    print('server: context canceled');
    print('server: hello handler ended');
    return;
  }

  req.response.write('hello\n');
  await req.response.close();
  print('server: hello handler ended');
}

Future<void> main() async {
  final server =
      await HttpServer.bind(InternetAddress.loopbackIPv4, 8090);

  print('Listening on http://localhost:8090');

  await for (final HttpRequest req in server) {
    if (req.uri.path == '/hello') {
      unawaited(hello(req));
    } else {
      req.response
        ..statusCode = HttpStatus.notFound
        ..write('Not found\n');
      await req.response.close();
    }
  }
}

// Helper to fire-and-forget a Future without triggering linter warnings.
void unawaited(Future<void> f) {}
