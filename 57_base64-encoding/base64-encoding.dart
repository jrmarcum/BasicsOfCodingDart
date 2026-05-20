// Dart provides built-in support for base64
// encoding/decoding via the `dart:convert` library.

import 'dart:convert';

void main() {
  // Here's the string we'll encode/decode.
  final data = "abc123!?\$*&()'-=@~";

  // Dart supports both standard and URL-safe base64.
  // Encode using the standard encoder.
  // base64Encode() takes a list of bytes (Uint8List or List<int>).
  final sEnc = base64Encode(utf8.encode(data));
  print(sEnc);

  // Decode the standard base64 string back to bytes, then to a string.
  final sDec = utf8.decode(base64Decode(sEnc));
  print(sDec);
  print('');

  // Encode/decode using the URL-safe base64 format.
  final uEnc = base64Url.encode(utf8.encode(data));
  print(uEnc);
  final uDec = utf8.decode(base64Url.decode(uEnc));
  print(uDec);
}
