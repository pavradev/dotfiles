#!/bin/bash
# Create and use swap file
# Note that swap will not be recreated after reboot
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
