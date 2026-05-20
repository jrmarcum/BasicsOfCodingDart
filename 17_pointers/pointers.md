#### Note: Dart has no pointers or address-of operator (`&`). Primitive values (`int`, `double`, `bool`) are always passed by value. To simulate pointer-like mutation of a primitive, wrap it in a class and pass the object reference. The `hashCode` printed on the last line is an object identity approximation and will differ each run.

___

##### Run Command:

`$ dart run pointers.dart`

##### Results:

`initial: 1`
`zeroval: 1`
`zeroref: 0`
`pointer: <hashCode>`
