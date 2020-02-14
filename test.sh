#!/bin/bash

INI_FILE="./demo.ini"

# returns an array of all sections
function get_sections_array() {
  ARRAY=($(egrep '\[.*\]' ${INI_FILE}))
  FIXED_ARRAY=""
  for i in "${ARRAY[@]}"; do
    FIX=$i
    FIX=$(echo $FIX | tr --delete "\r")
    FIX=$(echo $FIX | tr --delete "[")
    FIX=$(echo $FIX | tr --delete "]")
    FIXED_ARRAY+="${FIX} "
  done
  echo "${FIXED_ARRAY}"
}

# returns value of specific key in given section
# $1 - section
# $2 - key
function get_value_from_section_key() {
  echo "$(sed -nr "/^\[$1\]/ { :l /^$2[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" ${INI_FILE})"
}

echo "== demo =="
echo "file: ${INI_FILE}"
echo "--- list of sections (begin) ---"
# convert to
declare -a TARGETS="$(get_sections_array)"
for obj in ${TARGETS[@]}; do
    echo "$obj"
done
echo "--- list of sections (end) ---"

declare VAL=$(get_value_from_section_key "section1" "path")
echo "value of key 'path' in section 'section1': $VAL"
declare VAL=$(get_value_from_section_key "section2" "params")
echo "value of key 'params' in section 'section2': $VAL"
declare VAL=$(get_value_from_section_key "section3" "path")
echo "value of key 'path' in section 'section3': $VAL"
