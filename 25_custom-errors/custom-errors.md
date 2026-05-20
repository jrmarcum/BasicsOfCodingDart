#### Note: Dart custom errors implement `Exception` and override `toString()` instead of Go's `Error()` method. Go's `errors.As()` type assertion is replaced by Dart's static type system — the return type already carries the concrete error type.
___
##### Run Command:
`$ dart run custom-errors.dart`
##### Results:
`42`
`can't work with it`
