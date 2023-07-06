#!/usr/bin/bash

sudo mkdir /opt/nvidia_hotplugged
sudo cp ./nvidia_hotplugged.py /opt/nvidia_hotplugged/
sudo chmod +x /opt/nvidia_hotplugged/nvidia_hotplugged.py

sudo cp ./nvidia_hotplug.service  /etc/systemd/system/
sudo systemctl daemon-reload

sudo cp ./99-hotplugged.rules /etc/udev/rules.d/
sudo chmod a+r /etc/udev/rules.d/99-hotplugged.rules
sudo udevadm control --reload-rules
