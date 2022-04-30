#!/bin/sh

$(dirname "$0")/polybar.sh;

${HOME}/.local/bin/setupwallpaper || hsetroot -solid '@@background@@';

# (nitrogen --restore || true) & disown;
xset r rate 250 25;
xcompmgr & disown;
nm-applet & disown;
(clipit || true) & disown;
xfce4-power-manager & disown;
killall oneko;
oneko -bg '@@background@@' \
    -fg '@@foreground@@' -tofocus -sakura & disown;

setxkbmap -model pc104 -layout us,ru -option grp:alt_shift_toggle;
[ -f "${HOME}/.config/xkb.conf" ] \
    && xkbcomp "${HOME}/.config/xkb.conf" :0 2>/dev/null;
synclient HorizTwoFingerScroll=1 TapButton1=1 TapButton2=3 TapButton3=2;

