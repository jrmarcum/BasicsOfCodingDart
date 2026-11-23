#### Note: Dart does not have struct embedding. Composition is used instead: the `Container` class holds a `Base` instance as a named field (`base`) and explicitly delegates `describe()`. An `abstract interface class` replaces Go's implicit interface.
___
##### Run Command:
`$ dart run class-composition.dart`
##### Results:
`co={num: 1, str: some name}`
`also num: 1`
`describe: base with num=1`
`describer: base with num=1`
