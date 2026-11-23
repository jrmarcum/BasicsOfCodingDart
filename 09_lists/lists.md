#### Note: Dart uses `List` for both fixed-length arrays and slices. The `List` type is always growable by default. Use `sublist` instead of Go's slice syntax `s[low:high]`. Lists print with commas: `[a, b, c]` rather than Go's `[a b c]`.

___

##### Run Command:

`$ dart run lists.dart`

##### Results:

`emp: [, , ]`
`set: [a, b, c]`
`get: c`
`len: 3`
`apd: [a, b, c, d, e, f]`
`cpy: [a, b, c, d, e, f]`
`sl1: [c, d, e]`
`sl2: [a, b, c, d, e]`
`sl3: [c, d, e, f]`
`dcl: [g, h, i]`
`2d:  [[0], [1, 2], [2, 3, 4]]`
