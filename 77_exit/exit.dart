// Use `exit()` from `dart:io` to immediately exit with a given status.

import 'dart:io';

void main() {
  // In Dart, there is no `defer` mechanism. Registering a shutdown
  // callback with addShutdownHook is not available in the core SDK;
  // code after exit() simply does not run — matching Go's behaviour
  // where deferred functions are NOT called when os.Exit is used.

  // Exit with status 3.
  exit(3);
}
