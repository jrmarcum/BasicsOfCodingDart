#### Running this program will cause it to throw an unhandled exception, print an error message and stack trace, and exit with a non-zero status.
___
##### Run Command:

`$ dart run panic.dart`

##### Results:

`Unhandled exception:`
`Exception: a problem`
`#0      main (file:///...panic.dart:12:3)`
`...`
`exit code 255`
___
#### Note that unlike Go's `panic`, Dart uses exceptions for error handling. In Dart it is idiomatic to use typed exceptions and `try`/`catch` wherever possible, reserving unhandled throws for truly unexpected failures.
