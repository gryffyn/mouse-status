#!/usr/bin/env zsh

_set_color() {
  local device=$(ratbagctl list | cut -d: -f1)
  ratbagctl $device led 0 set color $1
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

precmd_functions+=(mouse_status)
