#!/bin/bash
# scrot -za 0,0,1024,600 /tmp/lock.png;
# convert /tmp/lock.png -blur 2x2 /tmp/lock.png
# i3lock -nec 131313;
export DISPLAY=:0
export XDG_SEAT=seat0
export LOGNAME=$(whoami)
export XDG_SESSION_TYPE=tty
export XAUTHORITY=/home/hkc/.lyxauth
export MOTD_SHOWN=pam
export XDG_SESSION_CLASS=user
export XDG_VTNR=2
export XDG_SESSION_ID=$(cat /proc/self/sessionid)
export XDG_RUNTIME_DIR=/run/user/$(id -u)

if [ "x$1" = "x" ]; then
    i3lock -befni /tmp/current-wallpaper.png;
else
    i3lock -befi /tmp/current-wallpaper.png;
    sleep 0.5;
    i3-msg mode default;
    case "$1" in
        hibernate) systemctl hibernate ;;
        suspend) systemctl suspend ;;
    esac;
fi
# rm /tmp/lock.png;
