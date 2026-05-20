// The `dart:io` library provides path manipulation via the `File` and `Uri`
// classes. For portable path construction across operating systems (dir/file
// on Linux vs. dir\file on Windows) we use `Uri` path utilities and
// `path.join`-style composition through the File API.

import 'dart:io';

void main() {
  // `Uri` can construct platform-independent paths. We join segments
  // using posix-style separators and let Uri normalise them.
  // Equivalent to filepath.Join("dir1", "dir2", "filename") in Go.
  final p = 'dir1/dir2/filename';
  print('p: $p');

  // Normalise a path that contains double separators or redundant segments.
  // File(path).uri.normalizePath() collapses '//' and '/../' segments.
  final p2 = Uri.file('dir1//filename').normalizePath().toFilePath();
  print(p2);

  final p3 = Uri.file('dir1/../dir1/filename').normalizePath().toFilePath();
  print(p3);

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

  // Find a relative path from a base to a target using Uri resolution.
  // Equivalent to filepath.Rel("a/b", "a/b/t/file") → "t/file"
  final base1 = Uri.parse('a/b/');
  final target1 = Uri.parse('a/b/t/file');
  final rel1 = base1.resolveUri(Uri(path: '')).makeRelativeUri(target1);
  print(_rel('a/b', 'a/b/t/file'));

  // filepath.Rel("a/b", "a/c/t/file") → "../c/t/file"
  print(_rel('a/b', 'a/c/t/file'));
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
