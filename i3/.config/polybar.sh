#!/bin/sh
echo "Killing polybar...";
killall -q polybar;

echo "Waiting for polybar to die...";
deadline=$(($(date +%s) + 10));
while pgrep -u $UID -x polybar >/dev/null; do
    sleep 0.5;
    [ $deadline -gt $(date +%s) ] || (
    echo "Timed out, force-killing...";
    killall -q -KILL polybar;
    );
done

MAIN_SCREEN_NAME="LVDS1"

if xrandr | grep "VGA1 connected" >/dev/null 2>&1; then
    echo "Configuring VGA1...";
    xrandr --output LVDS1 --off --output VGA1 --auto;
    echo "Running polybar::main @ VGA1...";
    MONITOR=VGA1 polybar main & disown;
    echo "Running polybar::tray @ VGA1...";
    MONITOR=VGA1 polybar tray & disown;
else
    xrandr --output $MAIN_SCREEN_NAME --auto --output VGA1 --off;
    echo "Running polybar::main @ LVDS1...";
    MONITOR=$MAIN_SCREEN_NAME polybar main & disown;
    echo "Running polybar::tray @ LVDS1...";
    MONITOR=$MAIN_SCREEN_NAME polybar tray & disown;
fi
setupwallpaper;

