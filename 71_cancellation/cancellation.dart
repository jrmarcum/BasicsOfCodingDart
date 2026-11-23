// In Go, context.Context carries cancellation signals across API boundaries.
// Dart's async model uses Future/Stream cancellation and timeouts instead.
// Here we demonstrate equivalent timeout/cancellation behaviour using
// an HttpServer with a client disconnect detector.

import 'dart:async';
import 'dart:io';

Future<void> hello(HttpRequest req) async {
  print('server: hello handler started');

  // dart:io's HttpServer does not report a client disconnect until a
  // write fails, so we take over the raw socket to notice when the
  // client goes away — the Dart analogue of ctx.Done().
  final socket = await req.response.detachSocket(writeHeaders: false);
  final clientGone = Completer<bool>();
  socket.listen((_) {}, onDone: () {
    if (!clientGone.isCompleted) clientGone.complete(true);
  }, onError: (_) {
    if (!clientGone.isCompleted) clientGone.complete(true);
  });

  // Simulate work: wait 10 seconds, unless the client cancels first.
  final work = Future<bool>.delayed(const Duration(seconds: 10), () => false);
  final cancelled = await Future.any([work, clientGone.future]);

  if (cancelled) {
    print('server: context canceled');
    socket.destroy();
  } else {
    socket.write('HTTP/1.1 200 OK\r\n'
        'content-type: text/plain\r\n'
        'content-length: 6\r\n'
        'connection: close\r\n\r\n'
        'hello\n');
    await socket.close();
  }
  print('server: hello handler ended');
}

Future<void> main() async {
  final server =
      await HttpServer.bind(InternetAddress.loopbackIPv4, 8090);

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
