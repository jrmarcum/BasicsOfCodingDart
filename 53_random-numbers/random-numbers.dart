// Dart's `dart:math` library provides pseudorandom number
// generation via the `Random` class.

import 'dart:io';
import 'dart:math';

void main() {
  // Random().nextInt(100) returns a random int n, 0 <= n < 100.
  final rng = Random();
  stdout.write('${rng.nextInt(100)},');
  print(rng.nextInt(100));

  // nextDouble() returns a double f, 0.0 <= f < 1.0.
  print(rng.nextDouble());

  // Generate random floats in the range 5.0 <= f < 10.0.
  stdout.write('${(rng.nextDouble() * 5) + 5},');
  print((rng.nextDouble() * 5) + 5);

  // Seeded random: seeding with the current time produces a
  // different sequence each run. Note: not cryptographically secure;
  // use `Random.secure()` for cryptographic purposes.
  final r1 = Random(DateTime.now().microsecondsSinceEpoch);
  stdout.write('${r1.nextInt(100)},');
  print(r1.nextInt(100));

  // If you seed with the same number, it produces the same
  // sequence of random numbers.
  final r2 = Random(42);
  stdout.write('${r2.nextInt(100)},');
  print(r2.nextInt(100));

  final r3 = Random(42);
  stdout.write('${r3.nextInt(100)},');
  print(r3.nextInt(100));
}
