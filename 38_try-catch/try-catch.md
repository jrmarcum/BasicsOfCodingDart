#### Note: Dart's `try/catch` directly replaces Go's `defer/recover` pattern. In Dart, any object can be thrown (not only `Exception`/`Error`), so `catch (r)` without a type annotation catches everything — matching Go's `recover()` which intercepts any panic value.
___
##### Run Command:
`$ dart run try-catch.dart`
##### Results:
`Recovered. Error:`
` a problem`
