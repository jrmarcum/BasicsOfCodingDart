// Environment variables are a universal mechanism for conveying
// configuration information to programs. Let's look at how to
// get and list environment variables in Dart.

import 'dart:io';

void main() {
  // To get a value for a key, use Platform.environment['KEY'].
  // This returns null if the key isn't present; we use ?? '' to
  // match Go's os.Getenv behaviour of returning an empty string.
  //
  // Note: Dart's Platform.environment is read-only; os.Setenv has
  // no direct equivalent. We cannot set env vars at runtime in Dart.
  // To demonstrate, we read FOO (set externally) and BAR.
  print('FOO: ${Platform.environment['FOO'] ?? ''}');
  print('BAR: ${Platform.environment['BAR'] ?? ''}');

  // Use Platform.environment to list all key/value pairs.
  // Here we print all the keys, matching Go's os.Environ() loop.
  print('');
  for (final key in Platform.environment.keys) {
    print(key);
  }
}
