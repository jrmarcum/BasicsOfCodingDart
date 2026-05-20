#### Note: `Future.wait()` is the Dart equivalent of `sync.WaitGroup`. Workers are scheduled concurrently on the event loop. Because Dart is single-threaded and cooperative, workers interleave at `await` points. The starting order is deterministic (1–5) but the "done" order may vary between runs.
___
##### Run Command:
`$ dart run waitgroups.dart`
##### Results:
`Worker 1 starting`
`Worker 2 starting`
`Worker 3 starting`
`Worker 4 starting`
`Worker 5 starting`
`Worker 1 done`
`Worker 2 done`
`Worker 3 done`
`Worker 4 done`
`Worker 5 done`
