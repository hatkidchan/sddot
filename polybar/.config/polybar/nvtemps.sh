#!/bin/sh
while sleep 2; do
	printf "%3s\n" "$(nvidia-smi | grep -oP '\d+C')";
done;
