#!/bin/bash

connected=$(xrandr | grep "HDMI-1-0")

if [[ ! -z "$connected" ]]; then
  xrandr --output HDMI-1-0 --auto --primary --output eDP-1 --off
fi
