// Dart has several useful functions for working with directories
// in the file system via the `dart:io` library.

import 'dart:io';

void main() {
  // Create a new sub-directory in the current working directory.
  final subdir = Directory('subdir');
  subdir.createSync();

  // Clean up the directory tree when we are done.
  // This mirrors Go's `defer os.RemoveAll("subdir")`.
  try {
    // Helper closure to create a new empty file.
    void createEmptyFile(String name) {
      File(name).createSync(recursive: true);
    }

    createEmptyFile('subdir/file1');

    // Create a hierarchy of directories, including parents.
    // Equivalent to os.MkdirAll — the recursive: true flag
    // creates all intermediate directories automatically.
    Directory('subdir/parent/child').createSync(recursive: true);

    createEmptyFile('subdir/parent/file2');
    createEmptyFile('subdir/parent/file3');
    createEmptyFile('subdir/parent/child/file4');

    // List directory contents with listSync().
    // Returns a list of FileSystemEntity objects.
    final entries = Directory('subdir/parent').listSync()
      ..sort((a, b) => a.path.compareTo(b.path));

    print('Listing subdir/parent');
    for (final entry in entries) {
      final name = entry.uri.pathSegments
          .lastWhere((s) => s.isNotEmpty, orElse: () => '');
      final isDir = entry is Directory;
      print('  $name $isDir');
    }

    // Note: Dart has no equivalent to os.Chdir(). The working directory
    // cannot be changed at runtime. We list the child directory by its
    // path directly instead of changing into it.
    final childEntries = Directory('subdir/parent/child').listSync()
      ..sort((a, b) => a.path.compareTo(b.path));

    print('Listing subdir/parent/child');
    for (final entry in childEntries) {
      final name = entry.uri.pathSegments
          .lastWhere((s) => s.isNotEmpty, orElse: () => '');
      final isDir = entry is Directory;
      print('  $name $isDir');
    }

    // Visit a directory recursively, including all sub-directories.
    // Equivalent to filepath.Walk in Go.
    print('Visiting subdir');
    _visit('subdir');
  } finally {
    subdir.deleteSync(recursive: true);
  }
}

/// Recursively visits [path] and prints each entry, mirroring filepath.Walk.
void _visit(String path) {
  final entity = FileSystemEntity.typeSync(path);
  final isDir = entity == FileSystemEntityType.directory;
  print('  $path $isDir');

  if (isDir) {
    final entries = Directory(path).listSync()
      ..sort((a, b) => a.path.compareTo(b.path));
    for (final entry in entries) {
      _visit(entry.path.replaceAll(r'\', '/'));
    }
  }
}
