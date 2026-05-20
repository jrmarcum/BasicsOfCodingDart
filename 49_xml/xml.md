#### Note: Dart's standard library does not include an XML encoder/decoder. This lesson builds XML strings manually to produce the same output. For production use, consider the [`xml`](https://pub.dev/packages/xml) package on pub.dev.
___
##### Run Command:

`$ dart run xml.dart`

##### Results:

` <plant id="27">`
`   <name>Coffee</name>`
`   <origin>Ethiopia</origin>`
`   <origin>Brazil</origin>`
` </plant>`
`<?xml version="1.0" encoding="UTF-8"?>`
` <plant id="27">`
`   <name>Coffee</name>`
`   <origin>Ethiopia</origin>`
`   <origin>Brazil</origin>`
` </plant>`
`Plant id=27, name=Coffee, origin=[Ethiopia, Brazil]`
` <nesting>`
`   <parent>`
`     <child>`
`       <plant id="27">`
`         <name>Coffee</name>`
`         <origin>Ethiopia</origin>`
`         <origin>Brazil</origin>`
`       </plant>`
`       <plant id="81">`
`         <name>Tomato</name>`
`         <origin>Mexico</origin>`
`         <origin>California</origin>`
`       </plant>`
`     </child>`
`   </parent>`
` </nesting>`
