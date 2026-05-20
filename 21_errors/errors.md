#### Note: Dart uses exceptions (try/catch) rather than multiple return values for error handling. Here we use Dart 3 records `(int, Exception?)` to closely mirror Go's `(int, error)` pattern. Custom errors implement `Exception` and override `toString()` in place of Go's `Error()` method.
___
##### Run Command:
`$ dart run errors.dart`
##### Results:
`f1 worked: 10`
`f1 failed: Exception: can't work with 42`
`f2 worked: 10`
`f2 failed: 42 - can't work with it`
`42`
`can't work with it`
