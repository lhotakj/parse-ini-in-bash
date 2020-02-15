#!/bin/bash

INI_FILE="./demo.ini"

# returns an array of all sections
# $1 - file
function get_sections_array() {
  ARRAY=($(egrep '\[.*\]' $1))
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
# $1 - file
# $2 - key
# $3 - section
function get_value_from_section_key() {
  echo "$(sed -nr "/^\[$2\]/ { :l /^$3[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $1)"
}

echo "== get_sections_array =="
# convert to array
declare -a TARGETS="$(get_sections_array ${INI_FILE})"
for obj in ${TARGETS[@]}; do
    echo "$obj"
done

echo "== get_value_from_section_key =="
echo "value of key 'path' in section 'section1':   $(get_value_from_section_key ${INI_FILE} "section1" "path")"
echo "value of key 'params' in section 'section2': $(get_value_from_section_key ${INI_FILE} "section2" "params")"
echo "value of key 'path' in section 'section3':   $(get_value_from_section_key ${INI_FILE} "section3" "path")"
