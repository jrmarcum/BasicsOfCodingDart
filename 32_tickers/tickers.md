#### Note: Output is time-dependent. The ticker produces ~3 ticks in 1600 ms before being stopped. Timestamps reflect actual run time and will differ each execution. Dart's `Stream.periodic` replaces Go's `time.NewTicker`.
___
##### Run Command:
`$ dart run tickers.dart`
##### Results:
`Tick at 2024-01-15 10:30:00.500000`
`Tick at 2024-01-15 10:30:01.000000`
`Tick at 2024-01-15 10:30:01.500000`
`Ticker stopped`
