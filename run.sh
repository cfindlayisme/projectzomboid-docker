#!/bin/bash
#
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

# Update/install server on startup
/steam/steamcmd.sh +force_install_dir /projectzomboid +login anonymous +app_update 380870 validate +quit

# Replace RCONPort and RCONPassword in the ini file with environment variables
for file in /root/Zomboid/Server/*.ini
do
    sed -i "s/^RCONPort=.*/RCONPort=${RCONPort}/" "$file"
    sed -i "s/^RCONPassword=.*/RCONPassword=${RCONPassword}/" "$file"
    echo "Updated $file:"
    echo "RCONPort is now set to ${RCONPort}"
    echo "RCONPassword is now set to ${RCONPassword}"
done

# config files in /root/Zomboid
/projectzomboid/start-server.sh