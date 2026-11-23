#### Note: Dart has no `select` statement. Multiple `Completer` futures are merged into a single `StreamController` so values are processed in arrival order — the same behaviour as Go's `select` over channels. Total runtime is ~2 seconds since both delays run concurrently.
___
##### Run Command:
`$ dart run completers.dart`
##### Results:
`received one`
`received two`
