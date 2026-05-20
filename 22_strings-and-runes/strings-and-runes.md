#### Note: Dart's `String` is internally UTF-16, while Go strings are byte slices of UTF-8. Dart's `runes` property exposes Unicode code points (equivalent to Go runes). UTF-8 byte offsets are computed manually to match Go's output exactly.
___
##### Run Command:
`$ dart run strings-and-runes.dart`
##### Results:
`Len: 18`
`e0 b8 aa e0 b8 a7 e0 b8 b1 e0 b8 aa e0 b8 94 e0 b8 b5`
`Rune count: 6`
`U+0E2A 'ส' starts at 0`
`U+0E27 'ว' starts at 3`
`U+0E31 'ั' starts at 6`
`U+0E2A 'ส' starts at 9`
`U+0E14 'ด' starts at 12`
`U+0E35 'ี' starts at 15`
``
`Using DecodeRuneInString`
`U+0E2A 'ส' starts at 0`
`found so sua`
`U+0E27 'ว' starts at 3`
`U+0E31 'ั' starts at 6`
`U+0E2A 'ส' starts at 9`
`found so sua`
`U+0E14 'ด' starts at 12`
`U+0E35 'ี' starts at 15`
