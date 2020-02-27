#!/usr/bin/env zsh

device=$(ratbagctl list | cut -d: -f1)
leds=$(ratbagctl $device info | grep "Number of Leds" | cut -d: -f2 | tr -d " ")

_set_color() {
  for ((i=0;i<=(leds-1);i++)); do
    ratbagctl $device led $i set color $1
  done
}


mouse_status() {
  local exit_status="${1:-$(print -P %?)}";
  local RED='FF0000'
  local GREEN='00FF00'
  local ORANGE='FF8C00'
  local BLUE='0000FF'

  case $exit_status in
      0)
        _set_color $GREEN
        ;;
      1)
        _set_color $ORANGE
        ;;
      127)
        _set_color $ORANGE
        ;;
      -1)
        _set_color $RED
        ;;
      *)
        _set_color $BLUE
        ;;
  esac
}

if (( $+commands[ratbagctl] )) ; then
  precmd_functions+=(mouse_status)
fi
