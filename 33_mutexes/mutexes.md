#### Note: Dart is single-threaded, so a mutex (`sync.Mutex`) has no direct equivalent. Integer increments within synchronous code are inherently safe. `Future.wait` models Go's `WaitGroup` pattern. The counters are updated correctly because Dart's event loop never preempts synchronous code mid-increment.
___
##### Run Command:
`$ dart run mutexes.dart`
##### Results:
`{a: 20000, b: 10000}`
