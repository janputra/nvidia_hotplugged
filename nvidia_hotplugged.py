#!/usr/bin/python3
import subprocess as sb 

xrandr_output = sb.check_output("xrandr",shell=True)
xrandr_output_str = xrandr_output.decode("utf-8")

