#!/usr/bin/env bash


percent=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

if (( $percent > 59  )); then
  echo "#[fg=#4ecf6c] #[italics]$percent%#[none]"
elif (( $percent > 19 )); then
  echo "#[fg=#bdb43c]ﯜ #[italics]$percent%#[none]"
else
  echo "#[fg=#cc0a00] #[italics]$percent%#[none]"
fi
