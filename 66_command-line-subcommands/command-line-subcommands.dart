// Some command-line tools, like the `dart` tool or `git`, have many
// *subcommands*, each with its own set of flags. For example, `dart run`
// and `dart pub` are two different subcommands of the `dart` tool.
//
// Dart has no built-in subcommand/flag-set parser. We check args[0] for
// the subcommand name and manually parse the remaining arguments.

import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print("expected 'foo' or 'bar' subcommands");
    exit(1);
  }

  switch (args[0]) {
    case 'foo':
      _runFoo(args.sublist(1));
    case 'bar':
      _runBar(args.sublist(1));
    default:
      print("expected 'foo' or 'bar' subcommands");
      exit(1);
  }
}

/// Parse and execute the `foo` subcommand.
/// Supports: --enable (bool), --name=<string>
void _runFoo(List<String> args) {
  bool enable = false;
  String name = '';
  final List<String> tail = [];

  int i = 0;
  while (i < args.length) {
    final arg = args[i];
    if (arg.startsWith('-')) {
      final stripped = arg.replaceFirst(RegExp(r'^-{1,2}'), '');
      if (stripped.contains('=')) {
        final parts = stripped.split('=');
        if (parts[0] == 'name') name = parts.sublist(1).join('=');
      } else if (stripped == 'enable') {
        enable = true;
      } else if (stripped == 'name') {
        i++;
        if (i < args.length) name = args[i];
      }
    } else {
      tail.addAll(args.sublist(i));
      break;
    }
    i++;
  }

  print("subcommand 'foo'");
  print('  enable: $enable');
  print('  name: $name');
  print('  tail: $tail');
}

/// Parse and execute the `bar` subcommand.
/// Supports: --level=<int>
void _runBar(List<String> args) {
  int level = 0;
  final List<String> tail = [];

  int i = 0;
  while (i < args.length) {
    final arg = args[i];
    if (arg.startsWith('-')) {
      final stripped = arg.replaceFirst(RegExp(r'^-{1,2}'), '');
      if (stripped.contains('=')) {
        final parts = stripped.split('=');
        if (parts[0] == 'level') level = int.parse(parts[1]);
      } else if (stripped == 'level') {
        i++;
        if (i < args.length) level = int.parse(args[i]);
      }
    } else {
      tail.addAll(args.sublist(i));
      break;
    }
    i++;
  }

  print("subcommand 'bar'");
  print('  level: $level');
  print('  tail: $tail');
}
