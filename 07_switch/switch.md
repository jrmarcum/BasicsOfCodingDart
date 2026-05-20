#### Note: Dart's `switch` does not support a type-switch expression like Go's `i.(type)`. Type checking is done with `is` inside `if/else` blocks. The weekday line (`It's a weekday` or `It's the weekend`) and the time-of-day line (`It's before noon` or `It's after noon`) will reflect the actual day and time when the program is run.

___

##### Run Command:

`$ dart run switch.dart`

##### Results:

`Write 2 as two`
`It's a weekday`
`It's after noon`
`I'm a bool`
`I'm an int`
`Don't know type String`
