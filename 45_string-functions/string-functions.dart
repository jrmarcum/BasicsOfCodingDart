// The Dart String class provides many useful string-related
// methods. Here are some examples to give you a sense of
// what's available.

// In Dart, string operations are methods on the String
// object itself rather than functions from a separate
// package. You can find more in the Dart String API docs.

void main() {
  // Alias print to a shorter name as we'll use it a lot below.
  final p = print;

  p('Contains:   ${('test').contains('es')}');
  p('Count:      ${'test'.split('t').length - 1}');
  p('HasPrefix:  ${'test'.startsWith('te')}');
  p('HasSuffix:  ${'test'.endsWith('st')}');
  p('Index:      ${'test'.indexOf('e')}');
  p('Join:       ${['a', 'b'].join('-')}');
  p('Repeat:     ${'a' * 5}');
  p('Replace:    ${'foo'.replaceAll('o', '0')}');
  p('Replace:    ${'foo'.replaceFirst('o', '0')}');
  p('Split:      ${'a-b-c-d-e'.split('-')}');
  p('ToLower:    ${'TEST'.toLowerCase()}');
  p('ToUpper:    ${'test'.toUpperCase()}');

  // Length gives the number of UTF-16 code units.
  // For ASCII strings this equals the number of characters.
  p('Len:  ${'hello'.length}');

  // Indexing a string in Dart returns the char code (int)
  // at that position, equivalent to Go's byte-level index.
  p('Char: ${'hello'.codeUnitAt(1)}');
}
