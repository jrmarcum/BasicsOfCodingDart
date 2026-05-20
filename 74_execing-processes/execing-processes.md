#### Note: Go's `syscall.Exec` replaces the current process image with a new one. Dart has no equivalent to `syscall.Exec`; `Process.run()` is used instead, which spawns a child process and waits for it to complete without replacing the current process.
___
##### Run Command:

`$ dart run execing-processes.dart`

##### Results:

`total 16`
`drwxr-xr-x  4 mark 136B Oct 3 16:29 .`
`drwxr-xr-x 91 mark 3.0K Oct 3 12:50 ..`
`-rw-r--r--  1 mark 1.3K Oct 3 16:28 execing-processes.dart`
