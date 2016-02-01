#!/bin/bash
#
# Patrick Jennings
# This xplanet script can be used to generate a xplanet wallpaper.
# See https://github.com/patrickjennings/XPlanet-Scripts

# Exit on any failure.
set -e

# Geometry of output image.
GEOMETRY='1920x1200'

# Xplanet options. Read `man xplanet` for an explanation of each option.
XOPTIONS='-num_times 1 -projection rectangular -quality 100 -light_time -verbosity -1'

# Date commands. May be different if you don't use coreutils.
TIMESTAMP=`date +%s`
MONTH=`date +%m`

# The name of the output image.
OUTPUTFILE="$HOME/.xplanet/xplanet.jpg"

# Folder defines.
SCRIPTFOLDER="$HOME/.xplanet"

# Cloud image or empty to not use cloud maps.
CLOUDFILE="$SCRIPTFOLDER/clouds.jpg"
# Earth base map image or empty to use xplanet default image.
MAPFILE="$SCRIPTFOLDER/world/$MONTH.jpg"
# Night image or empty.
NIGHTFILE="$SCRIPTFOLDER/night.gif"
# Bump map image or empty.
BUMPFILE="$SCRIPTFOLDER/bump.jpg"
# Specular map image or empty.
SPECULARFILE="$SCRIPTFOLDER/specular.jpg"

# Cloud map mirror or empty to never download cloud maps.
CLOUDMIRROR='http://xplanetclouds.com/free/local/clouds_2048.jpg'

# Amount of hours to wait to download a new cloud map. 0 to always download.
# Some mirrors will limit the amount of downloads per day. Be considerate!
DOWNLOADFREQ=12

# File to use for the temporary xplanet config.
# This file will be overwritten and deleted.
XCONFIGFILE=`mktemp`


# Internal functions.

# exit with or without an error message.
exit_gracefully () {
    if [ ! -z "$1" ];
    then
        echo "$1" >&2
    fi
    exit 1
}

# $1 is the config name.
# $2 is the file.
set_config_if_set () {
    if [ ! -z "$2" ];
    then
        if [ ! -f "$2" ];
        then
            exit_gracefully "Failed to locate $1 file $2"
        fi

        echo "$1=$2" >> "$XCONFIGFILE"
    fi
}


# Check that dependencies are installed.
DEPENDENCIES='xplanet curl'
for DEP in $DEPENDENCIES;
do
    command -v $DEP >/dev/null || exit_gracefully "$DEP is required to be installed."
done

# Populate xplanet config with earth section.
echo -e '[earth]\n"Earth"' > "$XCONFIGFILE"

# Add map file to config if set.
set_config_if_set 'map' "$MAPFILE"
# Add night file to config if set
set_config_if_set 'night_map' "$NIGHTFILE"
# Add bump file to config if set.
set_config_if_set 'bump_map' "$BUMPFILE"
# Add specular file to config if set.
set_config_if_set 'specular_map' "$SPECULARFILE"

# Add cloud map to config if set.
if [ ! -z "$CLOUDFILE" ];
then
    # Download cloud map if mirror is set and it has been over DOWNLOADFREQ time.
    if [ ! -z "$CLOUDMIRROR" ];
    then
        # Check if cloud map needs to be downloaded.
        SECONDS=`expr $DOWNLOADFREQ \* 3600`
        UTIME=`expr $SECONDS + 1`
        if [ -f "$CLOUDFILE" ];
        then
            MTIME=`stat -c %Y "$CLOUDFILE"`
            UTIME=`expr $TIMESTAMP \- $MTIME`
        fi

        if [ $UTIME -gt $SECONDS ]
        then
            # Get the cloud map.
            curl -s -S "$CLOUDMIRROR" -o "$CLOUDFILE"
        fi
    fi

    # Add cloud map to config if set.
    set_config_if_set 'cloud_map' "$CLOUDFILE"
fi

# Run xplanet.
xplanet -geometry "$GEOMETRY" -output "$OUTPUTFILE" -config "$XCONFIGFILE" $XOPTIONS

# Delete temporary config file.
rm "$XCONFIGFILE"
 
#echo "$OUTPUTFILE"
