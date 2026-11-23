// Writing a basic HTTP server is easy using Dart's `dart:io` library.

import 'dart:io';

// The hello handler writes a simple "hello\n" response.
Future<void> hello(HttpRequest req) async {
  req.response
    ..write('hello\n')
    ..close();
}

// The headers handler echoes all request headers back in the response body.
Future<void> headers(HttpRequest req) async {
  req.headers.forEach((name, values) {
    for (final value in values) {
      req.response.write('$name: $value\n');
    }
  });
  await req.response.close();
}

Future<void> main() async {
  // Bind to port 8090 on localhost.
  final server = await HttpServer.bind(
      InternetAddress.loopbackIPv4, 8090);

  // Process incoming requests.
  await for (final HttpRequest req in server) {
    switch (req.uri.path) {
      case '/hello':
        await hello(req);
      case '/headers':
        await headers(req);
      default:
        req.response
          ..statusCode = HttpStatus.notFound
          ..write('Not found\n');
        await req.response.close();
    }
  }
}
