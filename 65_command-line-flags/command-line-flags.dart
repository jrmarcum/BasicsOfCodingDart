// Command-line flags are a common way to specify options for command-line
// programs. For example, in `dart run flags.dart -numb=7` the `-numb=7`
// is a command-line flag.
//
// Dart's standard library does not include a `flag` package. The community
// package `package:args` provides equivalent functionality. Here we parse
// flags manually to demonstrate the concept without external dependencies.

void main(List<String> args) {
  // Default values — equivalent to flag.String/Int/Bool defaults in Go.
  String word = 'foo';
  int numb = 42;
  bool fork = false;
  String svar = 'bar';
  final List<String> tail = [];

  // Parse flags from the argument list.
  // We support the --key=value, --key value, and --bool-flag forms.
  int i = 0;
  while (i < args.length) {
    final arg = args[i];
    if (arg.startsWith('-')) {
      // Strip leading dashes (one or two).
      final stripped = arg.replaceFirst(RegExp(r'^-{1,2}'), '');
      if (stripped.contains('=')) {
        final parts = stripped.split('=');
        final key = parts[0];
        final value = parts.sublist(1).join('=');
        switch (key) {
          case 'word':
            word = value;
          case 'numb':
            numb = int.parse(value);
          case 'fork':
            fork = value == 'true' || value == '1';
          case 'svar':
            svar = value;
        }
      } else {
        // Boolean flag or next-token-value flag.
        switch (stripped) {
          case 'fork':
            fork = true;
          case 'word':
            i++;
            if (i < args.length) word = args[i];
          case 'numb':
            i++;
            if (i < args.length) numb = int.parse(args[i]);
          case 'svar':
            i++;
            if (i < args.length) svar = args[i];
          default:
            // Unknown flag — ignore (package:args would throw here).
            break;
        }
      }
    } else {
      // Positional argument — everything from here is a tail argument.
      tail.addAll(args.sublist(i));
      break;
    }
    i++;
  }

  print('word: $word');
  print('numb: $numb');
  print('fork: $fork');
  print('svar: $svar');
  print('tail: $tail');
}
