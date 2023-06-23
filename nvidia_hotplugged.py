#!/usr/bin/python3

import re
import subprocess
import os
import time

def get_resolutions():
    output = subprocess.check_output(['xrandr']).decode('utf-8')
    sections = re.findall(r'(\w+-\d+)\s+connected.*?\n((?:\s+.*?\n)+)', output, re.DOTALL)
  
    resolutions = {}
    for section in sections:
        port = section[0]
        resolution_lines = section[1].strip().split('\n')
        resolutions[port] = []                          # dictionaty for port
        for line in resolution_lines:
            match = re.search(r'(\d+x\d+)', line)
            if match:
                resolutions[port].append(match.group())
      #  resolutions[port] = [re.search(r'(\d+x\d+)', line).group() for line in resolution_lines]
    
    return resolutions

try_count=0
    
# Example usage
while True:
    found = False
    resolutions = get_resolutions()

    for port, resolutions in resolutions.items():
        if "HDMI" in port:
            if "3840x1080" in resolutions:
                cmd =f"xrandr --output {port} --mode 3840x1080"
                os.system(cmd)
            else:
                cmd =f"xrandr --output {port} --mode 1920x1080"
                os.system(cmd)
            found = True
            break
    try_count = try_count+1 
           
    if found or (try_count > 100):
        break    
    time.sleep(0.1)

