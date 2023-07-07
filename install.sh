#!/usr/bin/bash

sudo cp ./nvidia.conf /etc/modprobe.d/nvidia.conf
sudo update-initramfs -c -k all

sudo mkdir /opt/nvidia_hotplugged
sudo cp ./nvidia_hotplugged.py /opt/nvidia_hotplugged/
sudo chmod +x /opt/nvidia_hotplugged/nvidia_hotplugged.py

sudo cp ./nvidia_hotplug.service  /etc/systemd/system/
sudo systemctl daemon-reload

sudo cp ./99-hotplugged.rules /etc/udev/rules.d/
sudo chmod a+r /etc/udev/rules.d/99-hotplugged.rules
sudo udevadm control --reload-rules

echo "Installation is done"
echo "Please Reboot the System"