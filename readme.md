Hotplug Detection Handler Script for UBUNTU 18.04 


A. Using install.sh script to install hot plugged handler service
Use the command below
    sudo sh ./install.h


B. Manually  install hot plugged handler service
1. Create or edit the NVIDIA configuration file using a text editor. The file is usually located at /etc/modprobe.d/nvidia.conf.
2. Add the following line to the configuration file:

    options nvidia-drm modeset=1

3. This line enables the modeset feature for the NVIDIA driver.
4. Save the configuration file.
5. Update initramfs

   sudo update-initramfs -c -k all    

6. Reboot your system for the changes to take effect.

7. After booting up again, cp nvidia_hotplug.service to systmemd service directory by using below command  

    sudo cp ./nvidia_hotplug.service /etc/systemd/system/

for Ubuntu 18.04 LTS service file needs to be edited as below

    a. check $XAUTHORITY by running:
        echo $XAUTHORITY
    b. use printed result as XAUTHORITY environment in nvidia_hotplug.service service  as follow

    Environment= "XAUTHORITY=/printed $XAUTHORITY"

8. Reload systemd services by using following command
    sudo systemctl daemon-reload


9. Copy 99-hotplugged.rules, for Ubuntu 18.04 LTS, edit rules and change path for systemctl in RUN (from /usr/bin/systemctl to /bin/systemctl )

10. Make the rule file readable by udev by running the following command in the terminal:
    
    sudo chmod a+r /etc/udev/rules.d/99-hotplugged.rules

11. Reload the udev rules to apply the changes by running the following command:

    sudo udevadm control --reload-rules