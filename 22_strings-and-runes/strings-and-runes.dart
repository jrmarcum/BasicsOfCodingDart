// A Dart String is a sequence of UTF-16 code units. For Unicode
// text, Dart provides the `runes` property which exposes Unicode
// code points — equivalent to Go's rune type. The `codeUnits`
// property gives raw UTF-16 units, while `runes` gives full
// Unicode scalar values (code points).

void examineRune(int r) {
  // Compare a rune (code point) value directly.
  if (r == 't'.runes.first) {
    print('found tee');
  } else if (r == 'ส'.runes.first) {
    print('found so sua');
  }
}

void main() {
  // `s` is a String assigned the Thai word "สวัสดี".
  // Dart string literals are UTF-16 internally but the source
  // file is UTF-8, so the literal is stored correctly.
  const s = 'สวัสดี';

  // In Go, len(s) gives the number of UTF-8 bytes (18).
  // In Dart, s.length gives the number of UTF-16 code units.
  // Thai characters in this string are all in the BMP, so each
  // Unicode code point is one UTF-16 unit, giving length 6.
  // To match Go's byte count we encode to UTF-8 explicitly.
  final utf8Bytes = <int>[];
  for (final r in s.runes) {
    if (r < 0x80) {
      utf8Bytes.add(r);
    } else if (r < 0x800) {
      utf8Bytes.add(0xC0 | (r >> 6));
      utf8Bytes.add(0x80 | (r & 0x3F));
    } else if (r < 0x10000) {
      utf8Bytes.add(0xE0 | (r >> 12));
      utf8Bytes.add(0x80 | ((r >> 6) & 0x3F));
      utf8Bytes.add(0x80 | (r & 0x3F));
    } else {
      utf8Bytes.add(0xF0 | (r >> 18));
      utf8Bytes.add(0x80 | ((r >> 12) & 0x3F));
      utf8Bytes.add(0x80 | ((r >> 6) & 0x3F));
      utf8Bytes.add(0x80 | (r & 0x3F));
    }
  }
  print('Len: ${utf8Bytes.length}');

  // Print the hex values of each UTF-8 byte, mirroring Go's output.
  print(utf8Bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' '));

  // Count runes (Unicode code points) — equivalent to
  // utf8.RuneCountInString in Go.
  print('Rune count: ${s.runes.length}');

  // Iterate over runes with their byte offsets.
  // In Dart we compute the UTF-8 byte offset ourselves.
  int byteOffset = 0;
  for (final r in s.runes) {
    final codePoint = r.toRadixString(16).toUpperCase().padLeft(4, '0');
    final char = String.fromCharCode(r);
    print("U+$codePoint '$char' starts at $byteOffset");
    // Compute UTF-8 byte width of this rune.
    if (r < 0x80) {
      byteOffset += 1;
    } else if (r < 0x800) {
      byteOffset += 2;
    } else if (r < 0x10000) {
      byteOffset += 3;
    } else {
      byteOffset += 4;
    }
  }

  print('');
  print('Using DecodeRuneInString');
  // Dart has no utf8.DecodeRuneInString, but iterating s.runes
  // is equivalent — each iteration yields one Unicode code point.
  byteOffset = 0;
  for (final r in s.runes) {
    final codePoint = r.toRadixString(16).toUpperCase().padLeft(4, '0');
    final char = String.fromCharCode(r);
    print("U+$codePoint '$char' starts at $byteOffset");
    examineRune(r);
    if (r < 0x80) {
      byteOffset += 1;
    } else if (r < 0x800) {
      byteOffset += 2;
    } else if (r < 0x10000) {
      byteOffset += 3;
    } else {
      byteOffset += 4;
    }
  }
}
