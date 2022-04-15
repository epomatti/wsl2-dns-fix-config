#!/bin/sh

# common vars
wsl='/etc/wsl.conf'
resolv='/etc/resolv.conf'

# remove standard files
rm -f $wsl
rm -f $resolv

# Create custom WSL name resolution
cp ./dist/wsl.conf $wsl
cp ./dist/resolv.conf $resolv

# This prevents resolv.conf from being deleted when WSL starts
chattr +i $resolv

echo 'WSL name resolution configured'
echo 'Restart WSL on Windows: "wsl --shudown"'
