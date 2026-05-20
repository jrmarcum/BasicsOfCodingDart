// Dart offers built-in support for JSON encoding and
// decoding via the `dart:convert` library.

import 'dart:convert';

// We'll use these two classes to demonstrate encoding and
// decoding of custom types below.
class Response1 {
  int page;
  List<String> fruits;
  Response1(this.page, this.fruits);

  Map<String, dynamic> toJson() => {
        'Page': page,
        'Fruits': fruits,
      };
}

class Response2 {
  int page;
  List<String> fruits;
  Response2(this.page, this.fruits);

  Map<String, dynamic> toJson() => {
        'page': page,
        'fruits': fruits,
      };

  factory Response2.fromJson(Map<String, dynamic> json) =>
      Response2(json['page'] as int, List<String>.from(json['fruits'] as List));

  @override
  String toString() => '{$page $fruits}';
}

void main() {
  // Encode basic data types to JSON strings.
  print(jsonEncode(true));
  print(jsonEncode(1));
  print(jsonEncode(2.34));
  print(jsonEncode('vector'));

  // Slices and maps encode to JSON arrays and objects.
  final slcD = ['apple', 'peach', 'pear'];
  print(jsonEncode(slcD));

  final mapD = {'apple': 5, 'lettuce': 7};
  print(jsonEncode(mapD));

  // Encode custom data types using toJson().
  final res1D = Response1(1, ['apple', 'peach', 'pear']);
  print(jsonEncode(res1D.toJson()));

  // Custom field names via the toJson() map keys.
  final res2D = Response2(1, ['apple', 'peach', 'pear']);
  print(jsonEncode(res2D.toJson()));

  // Decode JSON into a generic map.
  final byt = '{"num":6.13,"strs":["a","b"]}';
  final dat = jsonDecode(byt) as Map<String, dynamic>;
  print(dat);

  // Access and type-cast decoded values.
  final num = dat['num'] as double;
  print(num);

  // Access nested data.
  final strs = dat['strs'] as List<dynamic>;
  final str1 = strs[0] as String;
  print(str1);

  // Decode JSON into a custom data type.
  final str = '{"page": 1, "fruits": ["apple", "peach"]}';
  final res = Response2.fromJson(jsonDecode(str) as Map<String, dynamic>);
  print(res);
  print(res.fruits[0]);

  // Encode directly to stdout.
  final d = {'apple': 5, 'lettuce': 7};
  print(jsonEncode(d));
}
