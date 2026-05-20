#### Note: Timestamps reflect actual run time and will differ each execution. The first 5 requests are spaced ~200 ms apart. For the bursty batch, the first 3 are served immediately (burst tokens), then requests 4 and 5 wait ~200 ms each. Dart uses `Future.delayed` and `Timer.periodic` in place of Go's `time.Tick` channel.
___
##### Run Command:
`$ dart run rate-limiting.dart`
##### Results:
`request 1 2024-01-15 10:30:00.200000`
`request 2 2024-01-15 10:30:00.400000`
`request 3 2024-01-15 10:30:00.600000`
`request 4 2024-01-15 10:30:00.800000`
`request 5 2024-01-15 10:30:01.000000`
`request 1 2024-01-15 10:30:01.001000`
`request 2 2024-01-15 10:30:01.002000`
`request 3 2024-01-15 10:30:01.003000`
`request 4 2024-01-15 10:30:01.203000`
`request 5 2024-01-15 10:30:01.403000`
