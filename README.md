# Basics of Coding Dart

## Preface

What this text is and what it is not: This text is intended to introduce the reader to the basics of the Dart programming language in the sense that they will be able to write minimal types of programs and run the code. It is not intended to go into advanced topics like advanced concurrency, Flutter UI development, advanced data structures, object-oriented design patterns, testing and debugging techniques, and other software engineering principals.

This project is part of a multi-language comparative study examining syntax, language simplicity, lines of code required, and run performance across several languages. Each language in the study implements the same set of 78 example programs, enabling direct side-by-side comparison.

The programs are intended to be run in the terminal as that is common to most operating systems. Linux and Mac come preinstalled with a terminal. Windows may or may not have it pre-installed. "Windows Terminal" can be installed from the Microsoft store. Just do a search for it and install it.

## Installation and Setup of Dart

To set up Dart for use, navigate to the [Dart](https://dart.dev/get-dart) website and follow the installation instructions for your operating system. A package manager makes the install process much easier (brew for Mac, chocolatey for Windows, and varies based on Linux distribution). If the language has been installed properly you will be able to type the following command in the terminal command line and receive the response shown:

```text
dart --version
Dart SDK version: 3.x.x (stable) ...
(Note: the version shown here varies with your installed version)
```

## How to Run Examples

Each lesson folder contains a `.dart` source file and a `.md` file showing the run command and expected output. To run any example, navigate to its folder in your terminal first, then use the command shown in the `.md` file:

```text
cd 01_hello-world
dart run hello-world.dart
```

### Notes on specific lessons

- **Lessons 58–60** (reading/writing files, line-filters): require a `tmp/` directory to exist at runtime. Create it with `mkdir tmp`. Lesson 58 also requires `tmp/dat.txt` containing `hello` and `dart` on separate lines.
- **Lesson 60** (line-filters): reads from stdin. Run with: `cat ./tmp/lines.txt | dart run line-filters.dart`
- **Lessons 64–66** (command-line args/flags/subcommands): pass arguments after the filename: `dart run command-line-arguments.dart a b c`
- **Lesson 68** (testing): requires `package:test`. Run with `dart test testing-and-benchmarking_test.dart`
- **Lessons 56 and 78** (SHA1 and SHA256 hashes): require the external `package:crypto` package. Add `crypto: ^3.0.0` to `pubspec.yaml` and run `dart pub get` before running those lessons.

## Comments

Comments are used to document what your code does so that others can understand it when reviewing your code. Comments also document items that are non-performant in order to debug the code items at a later date.

```dart
// This is a single-line comment

/*
  This is a
  multi-line comment
*/
```

## Keywords

|            |            |            |            |            |
|:----------:|:----------:|:----------:|:----------:|:----------:|
| abstract   | as         | assert     | async      | await      |
| base       | break      | case       | catch      | class      |
| const      | continue   | covariant  | default    | deferred   |
| do         | dynamic    | else       | enum       | export     |
| extends    | extension  | external   | factory    | false      |
| final      | finally    | for        | Function   | get        |
| hide       | if         | implements | import     | in         |
| interface  | is         | late       | library    | mixin      |
| new        | null       | of         | on         | operator   |
| part       | required   | rethrow    | return     | sealed     |
| set        | show       | static     | super      | switch     |
| sync       | this       | throw      | true       | try        |
| type       | typedef    | var        | void       | when       |
| with       | while      | yield      |            |            |

## Operators

> ### Arithmetic Operators
>
> |        |                                                    |
> |:------:|:---------------------------------------------------|
> | **+**  | add one number to another number                   |
> | **-**  | subtract one number from another number            |
> | **\*** | multiply one number by another number              |
> | **/**  | divide one number by another number (returns double) |
> | **~/** | integer (truncating) division                      |
> | **%**  | remainder of dividing one number by another number |
> | **++** | increase the value of a variable by 1              |
> | **--** | decrease the value of a variable by 1              |
>
> ### Comparison Operators
>
> |        |                                                         |
> |:------:|:--------------------------------------------------------|
> | **==** | check if a variable is equal to another                 |
> | **!=** | check if a variable is not equal to another             |
> | **>**  | check if a variable is greater than another             |
> | **<**  | check if a variable is less than another                |
> | **>=** | check if a variable is greater than or equal to another |
> | **<=** | check if a variable is less than or equal to another    |
>
> ### Logical Operators
>
> |          |                                                 |
> |:--------:|:------------------------------------------------|
> | **&&**   | returns true if both statements are true        |
> | **\|\|** | returns true if one of the statements are true  |
> | **!**    | reverse the result of a true or false statement |
>
> ### Assignment Operators
>
> |         |                                                                                                              |
> |:-------:|:-------------------------------------------------------------------------------------------------------------|
> | **=**   | assign a value to a variable                                                                                 |
> | **+=**  | add a number to the existing value of a variable and assign the result to variable                           |
> | **-=**  | subtract a number from the existing value of a variable and assign the result to variable                    |
> | **\*=** | multiply a number to the existing value of a variable and assign the result to variable                      |
> | **/=**  | divide the existing value of a variable by a number and assign the result to variable                        |
> | **%=**  | take the remainder of the existing value of a variable divided by a number and assign the result to variable |
> | **??=** | assign only if the variable is currently null                                                                |
>
> ### Bitwise Operators
>
> |        |                        |
> |:------:|:-----------------------|
> | **&**  | bitwise AND            |
> | **\|** | bitwise OR             |
> | **^**  | bitwise XOR            |
> | **~**  | bitwise complement     |
> | **<<** | left shift             |
> | **>>** | right shift            |

## Data Types

> ### 1. Variables
>> #### a. **String**: used for storing text; single or double quotes; supports `'hello $name'` interpolation
>>
>> #### b. **int**: 64-bit signed integer on native platforms
>>
>> #### c. **double**: 64-bit IEEE 754 floating-point number
>>
>> #### d. **num**: supertype of both `int` and `double`
>>
>> #### e. **bool**: `true` or `false`
>>
>> #### f. **List\<T\>**: ordered, growable array of a single type
>>
>> #### g. **Map\<K, V\>**: hash-map / dictionary type (insertion-ordered by default)
>>
>> #### h. **Set\<T\>**: unordered collection of unique elements
>>
>> #### i. **Symbol**: compile-time constant symbol name
>>
>> #### j. **dynamic**: opts out of static type checking; any value accepted at runtime

> ### 2. **const**: compile-time constants; value must be known at compile time
> ### 3. **final**: runtime constants; value assigned once, cannot be reassigned
> ### 4. **var**: type-inferred variable; type fixed after first assignment
> ### 5. **late**: non-nullable variable initialized after declaration

## Functions

> ### 1. Named functions: `int add(int a, int b) { return a + b; }`
> ### 2. Arrow functions: `int add(int a, int b) => a + b;`
> ### 3. Anonymous/closure functions: `(int x) => x * 2`
> ### 4. Optional positional parameters: `void f([int x = 0])`
> ### 5. Named parameters: `void f({required int x, int y = 0})`
> ### 6. Variadic equivalent: pass a `List<T>` parameter
> ### 7. Multiple return values: Dart 3 records — `(int, String) fn() => (1, 'a');`

## Statements

A statement is an instruction that a program can execute. They are usually made line by line in your coding file.

> ### Conditional Statements
>
> |             |                                                                                                        |
> |:-----------:|:-------------------------------------------------------------------------------------------------------|
> | **if-else** | performs a statement 'if' a condition is met, and if not (ie. 'else') performs the default statement  |
> | **switch**  | matches a value against patterns and executes the matching branch; supports guards with `when`         |
>
> ### Iterative Statements
>
> |               |                                                                                              |
> |:-------------:|:---------------------------------------------------------------------------------------------|
> | **for**       | standard C-style counted loop                                                                |
> | **for-in**    | loop over each element in an Iterable (List, Set, Map keys, etc.)                           |
> | **while**     | loop while a condition is true; equivalent to Go's condition-only `for`                     |
> | **do-while**  | loop body executes at least once before checking the condition                               |
>
> ### Transfer Statements
>
> |              |                                             |
> |:------------:|:--------------------------------------------|
> | **break**    | terminates a loop at the point of call      |
> | **continue** | continues to the next loop increment        |
> | **return**   | exits a function with an optional value     |
> | **throw**    | throws an exception (equivalent to `panic`) |

## Async / Concurrency

> ### 1. **Future\<T\>**: represents a value that will be available asynchronously
> ### 2. **async / await**: write async code in a sequential style
> ### 3. **Stream\<T\>**: sequence of asynchronous events (equivalent to Go channels)
> ### 4. **StreamController\<T\>**: creates and controls a Stream
> ### 5. **Future.wait(\[...\])**: wait for multiple futures (equivalent to WaitGroup)
> ### 6. **Isolate**: true parallelism via message passing (no shared memory)
> ### 7. **Timer**: one-shot or repeating callback (equivalent to `time.NewTimer`)
> ### 8. **Stream.periodic**: repeating stream events (equivalent to `time.NewTicker`)

## File Input and Output

> ### 1. File Input
>> #### a. `File('path').readAsStringSync()`
>>
>> #### b. `File('path').openSync()` with `RandomAccessFile`
>>
>> #### c. `stdin.readLineSync()` for reading from standard input
>>
> ### 2. File Output
>> #### a. String interpolation: `'Hello $name'`
>>
>> #### b. `File('path').writeAsStringSync(content)`
>>
>> #### c. `stdout.write(...)` / `print(...)` for standard output
>>
>> #### d. `jsonEncode(obj)` / `jsonDecode(str)` from `dart:convert`

## Attribution

This project is adapted in part from **[Basics of Coding Go](https://github.com/jrmarcum/BasicsOfCodingGo)**
by [Jon Marcum](https://github.com/jrmarcum), which was itself adapted from
**[Go by Example](https://github.com/mmcgrana/gobyexample)**
by [Mark McGranaghan](https://github.com/mmcgrana), both licensed under the
[Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).

The lesson files and code examples derived from those works retain their
CC BY 3.0 license. This project exists as a platform for multi-language
comparative study of syntax, language simplicity, lines of code required,
and run performance.

## License

This repository contains two tiers of content:

| Content | License |
| --- | --- |
| Lesson files and code examples adapted from *Basics of Coding Go* / *Go by Example* | [CC BY 3.0](http://creativecommons.org/licenses/by/3.0/) — see NOTICE |
| Original contributions by Jon Marcum (project structure, README, comparative study additions) | [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/) — see LICENSE |

The root `LICENSE` file (CC0) applies to Jon Marcum's original contributions.
The `NOTICE` file clarifies that CC BY 3.0 governs all content adapted from *Go by Example* and *Basics of Coding Go*.
