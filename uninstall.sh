#!/usr/bin/bash

sudo rm /etc/modprobe.d/nvidia.conf
sudo update-initramfs -c -k all

sudo rm /opt/nvidia_hotplugged/nvidia_hotplugged.py

sudo rm /etc/systemd/system/nvidia_hotplug.service
sudo systemctl daemon-reload

sudo rm /etc/udev/rules.d/99-hotplugged.rules
sudo udevadm control --reload-rules

echo "Uninstallation is done"
echo "Please Reboot the System"