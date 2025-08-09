#!/bin/bash
FILE="/home/woutm/Documents/SolarTeam/Notes/TODO.md"
COUNT=$(cat $FILE | grep "\- \[ \] [a-zA-Z0-9]" | wc -l)
TODOS=$(cat $FILE | grep "\- \[ \] [a-zA-Z0-9]" | sed -z 's/\n/\\n/g' | sed 's/\[ \]/󰄰/g')
DONE=$(cat $FILE | grep "\- \[x\] [a-zA-Z0-9]" | sed -z 's/\n/\\n/g' | sed 's/\[x\]/󰄴/g')
# TODOS=$(cat $FILE | grep "\- \[ \] [a-zA-Z0-9]" | sed -z 's/\- \[ \]/󰄰/g')
# DONE=$(cat $FILE | grep "\- \[x\] [a-zA-Z0-9]" | sed -z 's/\- \[x\]/󰄴/g')
printf '{"text": "%s", "tooltip": "%s"}' "$COUNT" "$TODOS"

