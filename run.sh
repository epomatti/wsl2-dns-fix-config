#!/bin/bash

WSL_PATH='/etc/wsl.conf'
RESOLV_PATH='/etc/resolv.conf'

# remove standard files
rm -f $WSL_PATH
rm -f $RESOLV_PATH

# Create custom WSL name resolution
sudo cp ./dist/wsl.conf $WSL_PATH
sudo cp ./dist/resolv.conf $RESOLV_PATH

# This prevents resolv.conf from being deleted when WSL starts
sudo chattr +i $RESOLV_PATH

echo 'WSL name resolution configured'
echo 'Restart WSL on Windows: "wsl --shutdown"'