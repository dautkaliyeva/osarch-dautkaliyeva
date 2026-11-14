#!/bin/sh
in=evidence/staff-broken.csv
out=evidence/staff-fixed.csv
iconv -f WINDOWS-1251 -t UTF-8 "$in" > "$out"
sed -i '' 's/\r$//' "$out"
