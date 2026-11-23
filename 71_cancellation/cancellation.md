#### Note: Go's `context.Context` carries cancellation signals across API boundaries and goroutines. Dart uses `Future`/`Stream` cancellation and timeouts instead. This example demonstrates equivalent cancellation behaviour using `HttpServer` with client disconnect detection via `Future.any`.
___
#### Run the server in the background, then simulate a client request to `/hello`. Hit Ctrl+C shortly after to signal cancellation.
___
##### Run Command:

`$ dart run cancellation.dart &`
`$ curl localhost:8090/hello`

##### Results:

`server: hello handler started`
`^C`
`server: context canceled`
`server: hello handler ended`
