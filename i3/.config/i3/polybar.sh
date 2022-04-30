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

MONITOR=VGA-0 polybar main & disown;
MONITOR=VGA-0 polybar tray & disown;
