#### Note: Unlike `go run`, `dart run` does not print the exit status; check it with `echo $?` (PowerShell: `$LASTEXITCODE`). The `!` in the `finally` block never prints because `exit()` ends the program immediately, as Go's `os.Exit` skips `defer`.
___
##### Run Command:

`$ dart run exit.dart`
`$ echo $?`

##### Results:

`3`
