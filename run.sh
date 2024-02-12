#!/bin/sh

# common vars
wsl='/etc/wsl.conf'
resolv='/etc/resolv.conf'

# remove standard files
rm -f $wsl
rm -f $resolv

# Create custom WSL name resolution
cp ./dist/wsl.conf $wsl

# Check if --dnsserver argument is provided
if [ "$1" = "--dnsservers" ]; then
    shift
    # Create a new resolv.conf file with default dns servers
    
    
    #overwrite the resolv.conf with with the given nameservers
    for server in "$@"; do
        echo "nameserver $server" >> $resolv
    done
else
    cp ./dist/resolv.conf $resolv
fi

# This prevents resolv.conf from being deleted when WSL starts
chattr +i $resolv

echo 'WSL name resolution configured'
echo 'Restart WSL on Windows: "wsl --shutdown"'