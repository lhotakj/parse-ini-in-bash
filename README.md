# Simple parser of INI files in bash

This code provides two functions:
- `get_sections_array` returning an array of existing sections
- `get_value_from_section_key` returns a value of given key in specific section

ini file:
```
[section1]
path=/home/jarda/
params=some spaces in between

[section2]
path=/local/usr/
params=dummy test

[section3]
path=    /extra/space/
params=   more spaces !
```

Output of test.sh:
```
$ ./test.sh
== get_sections_array ==
section1
section2
section3
== get_value_from_section_key ==
value of key 'path' in section 'section1':   /home/jarda/
value of key 'params' in section 'section2': dummy test
value of key 'path' in section 'section3':   /extra/space/
```
