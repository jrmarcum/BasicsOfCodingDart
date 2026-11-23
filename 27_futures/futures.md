#### Note: Dart is single-threaded and uses `Future` and `async/await` instead of goroutines. `Future(() => ...)` schedules work on the event loop. The order of concurrent output may differ from Go since Dart's scheduler is cooperative rather than preemptive. Output order between the `future` and anonymous function tasks may vary.
___
##### Run Command:
`$ dart run futures.dart`
##### Results:
`direct : 0`
`direct : 1`
`direct : 2`
`future : 0`
`future : 1`
`future : 2`
`going`
`done`
