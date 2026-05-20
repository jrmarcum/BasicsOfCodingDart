// SHA256 hashes are frequently used to compute short identities for
// binary or text blobs. Dart's standard library does not include SHA256;
// this lesson requires the `package:crypto` package.
// Add `crypto: ^3.0.0` to your pubspec.yaml dependencies.

import 'dart:convert';
import 'package:crypto/crypto.dart';

void main() {
  final s = 'sha256 this string';

  // sha256.convert() takes a list of bytes and returns a Digest.
  // utf8.encode() converts the string to bytes — equivalent to
  // []byte(s) in Go.
  final bytes = utf8.encode(s);
  final digest = sha256.convert(bytes);

  // Digest.toString() produces the lowercase hex string,
  // matching Go's fmt.Printf("%x\n", bs).
  print(s);
  print(digest.toString());
}
