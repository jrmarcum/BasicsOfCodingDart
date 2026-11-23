# BasicsOfCodingDart — Session Context

## What This Project Is

A multi-language comparative study of programming syntax, simplicity, lines
of code, and performance. Each language implements the same 78 example
programs so they can be compared side-by-side.

The source of truth for program logic and expected output is **Basics of
Coding Go** by Jon Marcum (<https://github.com/jrmarcum/BasicsOfCodingGo>).
The upstream submodule at `upstream/basicsofcodinggo/` is not currently
initialized in this repo — use `BasicsOfCodingV/upstream/basicsofcodinggo/`
on the local machine as the Go reference instead.

**Status:** All 78 lessons (01_hello-world through 78_sha256-hashes) are
implemented. Each lesson has both a `.dart` source file and a `.md` file.

## Project Structure

```text
BasicsOfCodingDart/
├── CLAUDE.md
├── LICENSE            — CC0 (Jon Marcum original contributions)
├── NOTICE             — CC BY 3.0 attribution for derived lesson content
├── README.md
├── .rumdl.toml
├── pubspec.yaml       — package:crypto (lessons 56, 78), package:test (68)
└── ##_topic-name/
    ├── topic-name.dart
    └── topic-name.md
```

All 78 lessons: `01_hello-world` through `78_sha256-hashes`.
Numbers match BasicsOfCodingGo exactly — do not renumber.

**Topic names:** Go-specific topic names are renamed to their Dart equivalent
(number unchanged, as in BasicsOfCodingCSharp): 09 slices→`lists`,
11 range→`for-in`, 17 pointers→`references`, 18 structs→`classes`,
23 struct-embedding→`class-composition`, 27 goroutines→`futures`,
28 channels→`streams`, 29 select→`completers`, 33 mutexes→`shared-state`,
34 atomic-counters→`async-counters`, 35 waitgroups→`future-wait`,
38 recover→`try-catch`, 42 panic→`throw`, 43 defer→`try-finally`,
71 context→`cancellation`. Topics with real Dart equivalents keep their names
(e.g. `closures`, `strings-and-runes` = `String.runes`). Program content uses
Dart terms too (`dartlang`, `future : 0`); only comments and notes that
compare against the Go source mention Go.

## Lesson .md Format (exact, no deviations)

```text
[#### Note: optional one-liner only when Dart differs from Go]
[___ only present when a Note line appears above it]

##### Run Command:

`$ dart run topic-name.dart`

##### Results:

`output line 1`
`output line 2`
```

If there is no Note, omit the Note line and the first `___` entirely.
Start directly with `##### Run Command:`. No per-file attribution footers.
Time-dependent or nondeterministic lessons note this in the description line.

## Licensing Rule

Do NOT add per-file attribution footers. Attribution is handled centrally
in README and NOTICE. This is intentional and differs from some other repos.

## Output Matching

Match upstream Go output line-for-line. Where the language produces
structurally different output (e.g., map ordering, collection formatting),
document the difference in the lesson `.md` Note line.

## Special Lessons

- **56** (SHA1 hashes): requires `package:crypto`. Add `crypto: ^3.0.0` to
  `pubspec.yaml` and run `dart pub get` before running.
- **58–60** (reading/writing files, line-filters): require a `tmp/`
  directory at runtime (gitignored, create manually). Lesson 58 also needs
  `tmp/dat.txt` containing `hello\n[lang]\n`. Lesson 60 reads from stdin:
  run with `cat ./tmp/lines.txt | dart run line-filters.dart`.
- **50–52, 32, 37**: time-dependent output — note in `.md` that results vary.
- **27–37** (concurrency): nondeterministic per-isolate ordering — note in `.md`.
- **64–66** (command-line args/flags/subcommands): pass args after the
  filename: `dart run command-line-arguments.dart a b c`.
- **68** (testing-and-benchmarking): use `package:test`. Run with
  `dart test testing-and-benchmarking_test.dart`. Has both `topic.dart`
  and `topic_test.dart` files.
- **76** (signals): to send a real Ctrl+C on Windows from a script, run the
  sender in its own console, call `SetConsoleCtrlHandler(NULL, FALSE)`
  (hosted shells start with Ctrl+C disabled and children inherit it), protect
  the sender with its own handler, start the lesson, then call
  `GenerateConsoleCtrlEvent(CTRL_C_EVENT, 0)`. Launch the real `dart.exe`
  (e.g. Flutter's `bin/cache/dart-sdk/bin/dart.exe`), not the `dart.bat`
  wrapper — cmd stops at "Terminate batch job (Y/N)?". On Linux,
  `kill -INT` the `dartvm` process running `signals.dart`.
- **78** (SHA256): requires `package:crypto`. Add `crypto: ^3.0.0` to
  `pubspec.yaml` and run `dart pub get` before running.

---

## Language-Specific Reference

### DART

**Toolchain:** Dart 3.x+

```text
$ dart run filename.dart
$ dart compile exe filename.dart   # compile to native binary
$ dart test                        # run tests (lesson 68)
$ dart pub get                     # install pubspec.yaml dependencies
```

**Key translations:**

| Go | Dart |
|---|---|
| `fmt.Println` | `print()` |
| `fmt.Printf` | `stdout.write()` / string interpolation `'${val}'` |
| Slices | `List<T>` |
| Maps | `Map<K, V>` |
| Multiple return | Records `(T1, T2)` (Dart 3+): `var (a, b) = fn();` |
| Closures | Function literals / anonymous functions **(native)** |
| Interfaces | Abstract classes / `implements` keyword |
| `defer` | `try/finally` block |
| goroutines | `Future` + `async`/`await` / `Isolate.spawn` |
| channels | `StreamController<T>` / `Stream<T>` |
| `select` | `Future.any([...])` or stream `listen` |
| `sync.WaitGroup` | `Future.wait([...futures])` |
| `sync.Mutex` | `package:synchronized` `Lock` |
| `sync/atomic` | `Isolate` message passing (no shared-memory atomic ops) |
| `error` | `Exception` / `Error` + `try/catch/finally` |
| `panic/recover` | `throw` / `try/catch` |
| `regexp` | `RegExp` class **(dart:core, no import needed)** |
| `os.Getenv` | `Platform.environment['VAR']` |
| `os.Setenv` | **Not available** — `Platform.environment` is read-only |
| `os.Args` | `main(List<String> args)` parameter |
| `syscall.Exec` | **Not available** — use `Process.run()` or `Process.start()` |
| `net/http` server | `dart:io` `HttpServer` |
| `net/http` client | `dart:io` `HttpClient` |
| SHA1 | `package:crypto` `sha1.convert(bytes)` |
| SHA256 | `package:crypto` `sha256.convert(bytes)` |
| Base64 | `dart:convert` `base64Encode` / `base64Decode` **(stdlib)** |
| `signal.Notify(SIGTERM)` | **Limited on Windows** — `ProcessSignal.sigterm` not supported |
| `os.Chdir` | **Not available** in Dart |

**Notes:**

- Dart has native async/await with `Future` and `Stream` — goroutine and
  channel patterns map naturally to `async`/`await` and `StreamController`.
- **Map ordering**: Dart's `Map` preserves insertion order (LinkedHashMap
  default). Go's map order is randomized. Lessons using maps will produce
  consistent (not random) output in Dart — document in `.md` if ordering
  differs from the Go output shown in the upstream reference.
- **No shared-memory atomics**: Dart isolates share no memory. Lessons that
  use `sync/atomic` in Go rely on Dart's single-threaded event loop instead
  (lesson 34 `async-counters`).
- **Read-only environment**: `Platform.environment` is read-only; there is
  no `os.Setenv` equivalent. Lesson 67 (environment-variables) documents this.
- **No syscall.Exec**: Dart has no `exec`-style process replacement.
  Use `Process.run()` for subprocess execution instead.
- **SIGTERM on Windows**: `ProcessSignal.sigterm` is not supported on
  Windows. The signal lesson notes this platform limitation.
- **No chdir**: Dart has no `os.Chdir` equivalent.
- Lesson 15 (closures): Dart has native closures; no workaround needed.
- Lesson 44 (collection-functions): `List` has `.map()`, `.where()`,
  `.reduce()`, `.fold()` natively.
- Lesson 47 (regexp): `RegExp` is in `dart:core`; no import required.
- Lessons 58–60 (file I/O): use `dart:io` `File`, `Directory`, `IOSink`.
- Lessons 64–66 (CLI args): `main(List<String> args)` receives args;
  use `package:args` for flag parsing.
- Networking lessons: use `dart:io` `HttpClient`/`HttpServer` or raw
  `ServerSocket`/`Socket`.

**.gitignore:** `.dart_tool/`, `.packages`, `build/`, `doc/api/`,
`pubspec.lock`, `tmp/`

## Markdown Linting

Markdown is linted with rumdl (VS Code extension `rvben.rumdl`), configured by
`.rumdl.toml`. The lesson `.md` house style (`___` separators,
`##### Run Command:` / `##### Results:` headings, verbatim output in code spans)
is intentional; disable a conflicting rule in `.rumdl.toml` rather than
reformatting lessons. `upstream/` is excluded from linting.
