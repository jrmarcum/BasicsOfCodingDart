// Dart has no stdlib text/template package. This lesson demonstrates
// equivalent template-style substitution using string replaceAll,
// which covers the core patterns from Go's text/template examples.

void main() {
  // Simple value substitution — equivalent to "Value: {{.}}"
  String t1(Object value) => 'Value: $value\n';

  stdout(t1('some text'));
  stdout(t1(5));
  stdout(t1(['Dart', 'Rust', 'C++', 'C#']));

  // Named-field substitution — equivalent to "Name: {{.Name}}"
  String t2(String name) => 'Name: $name\n';

  stdout(t2('Jane Doe'));
  stdout(t2('Mickey Mouse'));

  // Conditional substitution — equivalent to "{{if .}} yes {{else}} no {{end}}"
  String t3(String value) => value.isNotEmpty ? 'yes \n' : 'no \n';

  stdout(t3('not empty'));
  stdout(t3(''));

  // Range/loop substitution — equivalent to "Range: {{range .}}{{.}} {{end}}"
  String t4(List<String> items) => 'Range: ${items.join(' ')} \n';

  stdout(t4(['Dart', 'Rust', 'C++', 'C#']));
}

// Helper that writes to standard output without an extra newline
// (the template strings already include \n).
void stdout(String s) {
  // Dart's print() always appends a newline, so we use
  // the raw StringSink from stdout for fidelity.
  // We strip the trailing \n since print adds one.
  if (s.endsWith('\n')) {
    print(s.substring(0, s.length - 1));
  } else {
    print(s);
  }
}
