// SHA1 hashes are frequently used to compute short identities for
// binary or text blobs. For example, git uses SHA1 extensively
// to identify versioned files and directories.
// Dart's standard library does not include SHA1; this lesson
// requires the `package:crypto` package.
// Add `crypto: ^3.0.0` to your pubspec.yaml dependencies.

import 'dart:convert';
import 'package:crypto/crypto.dart';

void main() {
  final s = 'sha1 this string';

  // sha1.convert() takes a list of bytes and returns a Digest.
  // utf8.encode() converts the string to bytes — equivalent to
  // []byte(s) in Go.
  final bytes = utf8.encode(s);
  final digest = sha1.convert(bytes);

  // Digest.toString() produces the lowercase hex string,
  // matching Go's fmt.Printf("%x\n", bs).
  print(s);
  print(digest.toString());
}
