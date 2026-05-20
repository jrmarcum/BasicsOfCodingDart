#### Note: This lesson requires the `package:crypto` external package. Add `crypto: ^3.0.0` to your `pubspec.yaml` and run `dart pub get` before running the program.
___
##### Run Command:

`$ dart run sha1-hashes.dart`

##### Results:

`sha1 this string`
`cf23df2207d99a74fbe169e3eba035e633b65d94`
___
#### Running the program computes the hash and prints it in a human-readable hex format.
___
#### You can compute other hashes using a similar pattern. For example, to compute SHA256 hashes use `sha256.convert(bytes)` from the same `package:crypto` library.
___
#### Note that if you need cryptographically secure hashes, you should carefully research hash strength.
