// Dart has built-in support for regular expressions via
// the `RegExp` class. Here are some examples of common
// regexp-related tasks in Dart.

void main() {
  // This tests whether a pattern matches a string.
  print(RegExp(r'p([a-z]+)ch').hasMatch('peach'));

  // Compile a RegExp object for reuse.
  final r = RegExp(r'p([a-z]+)ch');

  // Match test using the compiled regexp.
  print(r.hasMatch('peach'));

  // Find the first matching string.
  print(r.firstMatch('peach punch')?.group(0));

  // Find the start and end indexes of the first match.
  final m0 = r.firstMatch('peach punch');
  if (m0 != null) {
    print('[${m0.start} ${m0.end}]');
  }

  // FindStringSubmatch: returns the whole match and submatches.
  final m1 = r.firstMatch('peach punch');
  if (m1 != null) {
    print([m1.group(0), m1.group(1)]);
  }

  // Indexes of matches and submatches.
  final m2 = r.firstMatch('peach punch');
  if (m2 != null) {
    print('[${m2.start} ${m2.end} ${m2.start + 1} ${m2.start + 3}]');
  }

  // Find all matching strings in the input.
  final allMatches = r.allMatches('peach punch pinch');
  print(allMatches.map((m) => m.group(0)).toList());

  // All matches with submatch indexes.
  print(allMatches
      .map((m) => '[${m.start} ${m.end} ${m.start + 1} ${m.start + 3}]')
      .toList());

  // Limit the number of matches by taking only the first 2.
  final limited = r.allMatches('peach punch pinch').take(2);
  print(limited.map((m) => m.group(0)).toList());

  // Match against bytes (encoded as a string in Dart).
  print(r.hasMatch('peach'));

  // Print the pattern string of the compiled regexp.
  print(r.pattern);

  // Replace matches with another value.
  print(r.replaceAll('a peach', '<fruit>'));

  // Replace using a function to transform matched text.
  print(r.replaceAllMapped('a peach', (m) => m.group(0)!.toUpperCase()));
}
