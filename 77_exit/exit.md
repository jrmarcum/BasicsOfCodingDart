#### If you run `exit.dart` using `dart run`, the exit will be picked up by `dart` and printed. Note that Dart has no `defer` mechanism, and code after `exit()` does not run — matching Go's behaviour where deferred functions are NOT called when `os.Exit` is used.
___
##### Run Command:

`$ dart run exit.dart`

##### Results:

`exit status 3`
