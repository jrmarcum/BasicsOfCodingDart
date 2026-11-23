#### Note: Dart uses `for-in` loops and `.entries` for map/list iteration instead of Go's `range` keyword. Dart's `Map` preserves insertion order, so map entries always appear in insertion order. String iteration uses `.runes` to get Unicode code points (equivalent to Go runes).

___

##### Run Command:

`$ dart run for-in.dart`

##### Results:

`sum: 9`
`index: 1`
`a -> apple`
`b -> banana`
`key: a`
`key: b`
`0 100`
`1 97`
`2 114`
`3 116`
