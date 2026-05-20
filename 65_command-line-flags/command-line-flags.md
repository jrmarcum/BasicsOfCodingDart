#### Note: Dart's standard library has no built-in `flag` package. This example parses flags manually. The community package `package:args` provides equivalent functionality with a richer API.
___
##### Run Command:

`$ dart run command-line-flags.dart -word=opt -numb=7 -fork -svar=flag`

##### Results:

`word: opt`
`numb: 7`
`fork: true`
`svar: flag`
`tail: []`
___
#### Note that if you omit flags they automatically take their default values.
___
##### Run Command:

`$ dart run command-line-flags.dart -word=opt`

##### Results:

`word: opt`
`numb: 42`
`fork: false`
`svar: bar`
`tail: []`
___
#### Trailing positional arguments can be provided after any flags.
___
##### Run Command:

`$ dart run command-line-flags.dart -word=opt a1 a2 a3`

##### Results:

`word: opt`
`numb: 42`
`fork: false`
`svar: bar`
`tail: [a1, a2, a3]`
