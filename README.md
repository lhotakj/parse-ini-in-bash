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

Demo returns:
```
== demo ==
file: ./demo.ini
--- list of sections (begin) ---
section1
section2
section3
--- list of sections (end) ---
value of key 'path' in section 'section1': /home/jarda/
value of key 'params' in section 'section2': dummy test
value of key 'path' in section 'section3': /extra/space/
```
