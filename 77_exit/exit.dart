// Use `exit()` from `dart:io` to immediately exit with a given status.

import 'dart:io';

void main() {
  // `finally` blocks will NOT run when using exit(), so this
  // print will never be called — matching Go, where deferred
  // functions are not run when os.Exit is used.
  try {
    // Exit with status 3.
    exit(3);
  } finally {
    print('!');
  }
}
