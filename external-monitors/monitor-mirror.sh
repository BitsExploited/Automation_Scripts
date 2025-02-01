#!/bin/bash

connected=$(xrandr | grep "HDMI-1-0 connected")

if [[ ! -z "$connected"  ]]; then

  xrandr --output HDMI-1-0 --mode 1920x1080
fi
