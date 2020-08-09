#!/usr/bin/env bash

os=$(uname -s)

if [[ $os == 'Darwin' ]]; then
 percent=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
else
  percent=$(acpi | awk '{ print $4 }' | sed 's/%,\?//')
fi

if (( $percent > 59  )); then
  echo "#[fg=#4ecf6c]#[italics]$percent%#[none]"
elif (( $percent > 19 )); then
  echo "#[fg=#bdb43c]#[italics]$percent%#[none]"
else
  echo "#[fg=#cc0a00]#[italics]$percent%#[none]"
fi
