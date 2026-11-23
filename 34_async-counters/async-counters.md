#### Note: Dart has no `sync/atomic` package because Dart isolates do not share memory. Within a single isolate (the normal execution model), a plain `int` counter is inherently safe — there is no preemptive thread switching that could cause a data race. The result is always exactly 50,000.
___
##### Run Command:
`$ dart run async-counters.dart`
##### Results:
`ops: 50000`
