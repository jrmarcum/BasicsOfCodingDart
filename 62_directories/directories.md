#### Note: Dart has no equivalent to `os.Chdir()`. The working directory cannot be changed at runtime, so the child directory is listed directly by path rather than by changing into it.
___
##### Run Command:

`$ dart run directories.dart`

##### Results:

`Listing subdir/parent`
`  child true`
`  file2 false`
`  file3 false`
`Listing subdir/parent/child`
`  file4 false`
`Visiting subdir`
`  subdir true`
`  subdir/file1 false`
`  subdir/parent true`
`  subdir/parent/child true`
`  subdir/parent/child/file4 false`
`  subdir/parent/file2 false`
`  subdir/parent/file3 false`
