// The `dart:io` library comes with support for HTTP clients.
// In this example we use it to issue a simple HTTP GET request.

import 'dart:io';

Future<void> main() async {
  // Create an HttpClient and issue a GET request.
  // This is equivalent to http.Get() in Go.
  final client = HttpClient();

  try {
    final request =
        await client.getUrl(Uri.parse('https://gobyexample.com'));
    final response = await request.close();

    // Print the HTTP response status.
    print('Response status: ${response.statusCode} ${response.reasonPhrase}');

    // Read and print the first 5 lines of the response body.
    int lineCount = 0;
    final StringBuffer buffer = StringBuffer();

    await for (final chunk in response.transform(
        SystemEncoding().decoder)) {
      buffer.write(chunk);
      final lines = buffer.toString().split('\n');
      // Keep the last (possibly incomplete) line in the buffer.
      buffer.clear();
      buffer.write(lines.last);

      for (int i = 0; i < lines.length - 1 && lineCount < 5; i++) {
        print(lines[i]);
        lineCount++;
      }
      if (lineCount >= 5) break;
    }
  } finally {
    client.close();
  }
}
