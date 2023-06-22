#!/usr/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/$USER/.Xauthority


function connect(){
    xrandr --output HDMI-0 --mode 1680x1050  
    echo "xrandr connect" >> "/home/jan/hotplug.log"
}
  
function disconnect(){
      xrandr --output HDMI-0 --off
      echo "xrandr disconnect" >> "/home/jan/hotplug.log"
}


xrandr | grep "HDMI-0 connected" &> /dev/null && connect || disconnect
