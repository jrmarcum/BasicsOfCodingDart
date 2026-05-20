#### The string encodes to slightly different values with the standard and URL-safe base64 encoders (trailing `+` vs `-`) but both decode to the original string as desired.
___
##### Run Command:

`$ dart run base64-encoding.dart`

##### Results:

`YWJjMTIzIT8kKiYoKSctPUB+`
`abc123!?$*&()'-=@~`

`YWJjMTIzIT8kKiYoKSctPUB-`
`abc123!?$*&()'-=@~`
