#### Note: Dart is single-threaded and uses `Future` and `async/await` instead of goroutines. `Future(() => ...)` schedules work on the event loop. The order of concurrent output may differ from Go since Dart's scheduler is cooperative rather than preemptive. Output order between the goroutine and anonymous function tasks may vary.
___
##### Run Command:
`$ dart run goroutines.dart`
##### Results:
`direct : 0`
`direct : 1`
`direct : 2`
`goroutine : 0`
`goroutine : 1`
`goroutine : 2`
`going`
`done`
