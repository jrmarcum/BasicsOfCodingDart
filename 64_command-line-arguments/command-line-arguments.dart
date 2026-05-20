// Command-line arguments are a common way to parameterize execution
// of programs. For example, `dart run command-line-arguments.dart a b c`
// passes `a`, `b`, and `c` as arguments to the program.

void main(List<String> args) {
  // In Dart, `main` receives command-line arguments directly as a
  // `List<String>`. Unlike Go's os.Args, the program name is NOT included;
  // the list contains only the user-supplied arguments.

  // Equivalent to os.Args (with program name) — we simulate it by
  // prepending a placeholder for the script path.
  final argsWithProg = ['command-line-arguments.dart', ...args];
  final argsWithoutProg = args;

  // Access individual args by index — equivalent to os.Args[3] in Go
  // (which is args[2] here since we have no program name in args).
  final arg = args[2];

  print(argsWithProg);
  print(argsWithoutProg);
  print(arg);
}
