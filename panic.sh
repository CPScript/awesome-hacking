#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root, type `su`" 1>&2
   exit 1
fi

# Confirm with the user before proceeding
read -p "Are you sure you want to trigger a kernel panic? This will crash the system. (y/n) " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    # Trigger a kernel panic
    echo 'c' | tee -a /proc/sysrq-trigger
else
    echo "aborted."
    exit 0
fi
