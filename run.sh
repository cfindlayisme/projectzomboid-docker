#!/bin/bash
#
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

# Update/install server on startup
/steam/steamcmd.sh +force_install_dir /projectzomboid +login anonymous +app_update 380870 validate +quit

# config files in /root/Zomboid
/projectzomboid/start-server.sh