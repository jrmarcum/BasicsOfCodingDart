##### Run Command:

`$ dart run command-line-subcommands.dart foo -enable -name=joe a1 a2`

##### Results:

`subcommand 'foo'`
`  enable: true`
`  name: joe`
`  tail: [a1, a2]`
___
#### Now try bar.
___
##### Run Command:

`$ dart run command-line-subcommands.dart bar -level 8 a1`

##### Results:

`subcommand 'bar'`
`  level: 8`
`  tail: [a1]`
