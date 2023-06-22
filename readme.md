1. Create or edit the NVIDIA configuration file using a text editor. The file is usually located at /etc/modprobe.d/nvidia.conf.
2. Add the following line to the configuration file:

    options nvidia-drm modeset=1

3. This line enables the modeset feature for the NVIDIA driver.
4. Save the configuration file.
5. Reboot your system for the changes to take effect.

6. Create a new udev rule to trigger your script. In a text editor, create a new file in the /etc/udev/rules.d/ directory.
7. Copy 99-hotplugged.rules, edit the path to the script
8. Make the rule file readable by udev by running the following command in the terminal:
    
    sudo chmod a+r /etc/udev/rules.d/99-monitor-detection.rules

9. Reload the udev rules to apply the changes by running the following command:

    sudo udevadm control --reload-rules