// The `dart:io` library provides path manipulation via the `File` and `Uri`
// classes. For portable path construction across operating systems (dir/file
// on Linux vs. dir\file on Windows) we use `Uri` path utilities and
// `path.join`-style composition through the File API.

import 'dart:io';

void main() {
  // `_join` builds a path from segments using '/' separators, so the
  // output is the same on every operating system.
  // Equivalent to filepath.Join("dir1", "dir2", "filename") in Go.
  final p = _join(['dir1', 'dir2', 'filename']);
  print('p: $p');

  // Joining also normalises paths, removing superfluous
  // separators and directory changes.
  print(_join(['dir1//', 'filename']));
  print(_join(['dir1/../dir1', 'filename']));

  // Split a path into directory and base name components using File.
  final file = File(p);
  // parent.path gives the directory portion — equivalent to filepath.Dir.
  print('Dir(p): ${file.parent.path}');
  // uri.pathSegments.last gives the file name — equivalent to filepath.Base.
  print('Base(p): ${file.uri.pathSegments.last}');

  // Check whether a path is absolute.
  print(File('dir/file').uri.isAbsolute); // false
  print(File('/dir/file').uri.isAbsolute); // true on Unix; adjust for Windows

  final filename = 'config.json';

  // Extract the extension (including the leading dot).
  final ext = filename.contains('.')
      ? '.${filename.split('.').last}'
      : '';
  print(ext);

  // Strip the extension to get the stem.
  final stem = ext.isNotEmpty
      ? filename.substring(0, filename.length - ext.length)
      : filename;
  print(stem);

  // Find a relative path from a base to a target.
  // Equivalent to filepath.Rel("a/b", "a/b/t/file") → "t/file"
  print(_rel('a/b', 'a/b/t/file'));

  // filepath.Rel("a/b", "a/c/t/file") → "../c/t/file"
  print(_rel('a/b', 'a/c/t/file'));
}

/// Joins [parts] with '/' and cleans the result, mirroring filepath.Join:
/// empty and '.' segments are dropped and '..' removes the previous one.
String _join(List<String> parts) {
  final out = <String>[];
  for (final seg in parts.join('/').split('/')) {
    if (seg.isEmpty || seg == '.') continue;
    if (seg == '..' && out.isNotEmpty && out.last != '..') {
      out.removeLast();
    } else {
      out.add(seg);
    }
  }
  return out.join('/');
}

/// Computes a relative path from [from] to [to], mirroring filepath.Rel.
String _rel(String from, String to) {
  final fromParts = from.split('/');
  final toParts = to.split('/');

  // Find the common prefix length.
  int common = 0;
  while (common < fromParts.length &&
      common < toParts.length &&
      fromParts[common] == toParts[common]) {
    common++;
  }

  // Build the relative path: go up for each remaining from segment, then
  // append the remaining to segments.
  final ups = fromParts.length - common;
  final result = <String>[
    for (int i = 0; i < ups; i++) '..',
    ...toParts.sublist(common),
  ];
  return result.join('/');
}
