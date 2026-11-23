// Dart's `dart:io` library provides ServerSocket for building TCP servers.

import 'dart:io';

Future<void> main() async {
  // Bind a TCP server socket to port 8090 on all interfaces.
  final server =
      await ServerSocket.bind(InternetAddress.anyIPv4, 8090);

  // Close the server when the application exits (Dart handles this via
  // process lifecycle; we defer close in a shutdown hook if needed).

  // Accept and handle connections in a loop.
  await for (final Socket conn in server) {
    // Handle each connection in a separate async call so the main loop
    // can continue accepting new connections.
    _handleConnection(conn);
  }
}

/// Handles a single client connection: reads one line and sends an ACK.
Future<void> _handleConnection(Socket conn) async {
  try {
    final StringBuffer incoming = StringBuffer();

    await for (final data in conn) {
      incoming.write(String.fromCharCodes(data));
      // Process once we see a newline terminator.
      if (incoming.toString().contains('\n')) break;
    }

    // Echo the message back in upper case with an ACK prefix.
    final message = incoming.toString().trimRight();
    final response = 'ACK: ${message.toUpperCase()}\n';
    conn.write(response);
  } catch (e) {
    stderr.writeln('Read error: $e');
  } finally {
    await conn.close();
  }
}
