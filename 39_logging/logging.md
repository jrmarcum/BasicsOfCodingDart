#### Note: Dart's standard library has no equivalent of Go's `log` or `log/slog` packages. A minimal `SimpleLogger` class mimics `log.Logger` (prefix + timestamp), and a `StructuredLogger` emits JSON lines like `log/slog`. The file/line flag is approximated with a fixed placeholder. Timestamps depend on actual run time.
___
##### Run Command:
`$ dart run logging.dart`
##### Results:
`2024/01/15 10:45:16 standard logger`
`2024/01/15 10:45:16.904141 with micro`
`2024/01/15 10:45:16 logging.dart:40: with file/line`
`my:2024/01/15 10:45:16 from mylog`
`ohmy:2024/01/15 10:45:16 from mylog`
`from buflog:buf:2024/01/15 10:45:16 hello`
`{"time":"2024-01-15T10:45:16.904166","level":"INFO","msg":"hi there"}`
`{"time":"2024-01-15T10:45:16.904178","level":"INFO","msg":"hello again","key":"val","age":25}`
