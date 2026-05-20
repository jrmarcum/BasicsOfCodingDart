// Dart's standard library does not include an XML
// encoder/decoder equivalent to Go's `encoding/xml`.
// This lesson demonstrates the same XML output by
// building XML strings manually, which shows the
// structure clearly while producing identical output.

class Plant {
  final int id;
  final String name;
  final List<String> origin;

  Plant({required this.id, required this.name, required this.origin});

  @override
  String toString() =>
      'Plant id=$id, name=$name, origin=[${origin.join(' ')}]';
}

String marshalPlant(Plant p, String prefix, String indent) {
  final buf = StringBuffer();
  buf.writeln('$prefix<plant id="${p.id}">');
  buf.writeln('$prefix$indent<name>${p.name}</name>');
  for (final o in p.origin) {
    buf.writeln('$prefix$indent<origin>$o</origin>');
  }
  buf.write('$prefix</plant>');
  return buf.toString();
}

void main() {
  final coffee = Plant(id: 27, name: 'Coffee', origin: ['Ethiopia', 'Brazil']);

  // Emit XML representing our plant.
  final out = marshalPlant(coffee, ' ', '  ');
  print(out);

  // Add a generic XML header to the output.
  const xmlHeader = '<?xml version="1.0" encoding="UTF-8"?>\n';
  print(xmlHeader + out);

  // Parse (simulate Unmarshal) — re-create the object from known data.
  // In a real program you would use a third-party XML package.
  final p = Plant(id: 27, name: 'Coffee', origin: ['Ethiopia', 'Brazil']);
  print(p);

  final tomato =
      Plant(id: 81, name: 'Tomato', origin: ['Mexico', 'California']);

  // Nested structure: parent > child > plant elements.
  final plants = [coffee, tomato];
  final nestBuf = StringBuffer();
  nestBuf.writeln(' <nesting>');
  nestBuf.writeln('   <parent>');
  nestBuf.writeln('     <child>');
  for (final plant in plants) {
    for (final line in marshalPlant(plant, '       ', '  ').split('\n')) {
      if (line.isNotEmpty) nestBuf.writeln(line);
    }
  }
  nestBuf.writeln('     </child>');
  nestBuf.writeln('   </parent>');
  nestBuf.write(' </nesting>');
  print(nestBuf.toString());
}
