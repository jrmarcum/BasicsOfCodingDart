#### Note: Dart's `Platform.environment` is read-only; there is no equivalent to Go's `os.Setenv`. Set environment variables externally before running the program.
___
#### Running the program shows that `FOO` is empty (not set externally) and `BAR` is empty.
___
##### Run Command:

`$ dart run environment-variables.dart`

##### Results:

`FOO: `
`BAR: `
`...`
___
#### The total list of keys in the environment will depend on your particular machine.
___
#### If we set `FOO` and `BAR` in the environment first, the running program picks those values up.
___
##### Run Command:

`$ $Env:FOO=1; $Env:BAR=2; dart run environment-variables.dart` (for Windows)

`$ FOO=1 BAR=2 dart run environment-variables.dart` (for Unix-like environments)

##### Results:

`FOO: 1`
`BAR: 2`
`...`
