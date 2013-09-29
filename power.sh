#!/bin/sh
if [ -n "$1" ];then
  case $1 in
  shutdown)
    zenity --question --text "Shutdown?" && sudo shutdown -h now
    ;;
  reboot)
    zenity --question --text "Reboot?" && sudo reboot
    ;;
  suspend)
    dbus-send --system --print-reply \
    --dest="org.freedesktop.UPower" \
    /org/freedesktop/UPower \
    org.freedesktop.UPower.Suspend 
    ;;
  lock)
    gnome-screensaver-command -l
    ;;
  esac
fi
