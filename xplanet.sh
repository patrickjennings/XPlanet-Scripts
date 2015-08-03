#
# Written by Patrick Jennings
#
# This xplanet script can be used to automatically update a users
# desktop background.
#

#!/bin/bash

homeDir=${HOME}

# Usually the monitor size.
geometry=1920x1200

# Where the xplanet config file is located
configFile=$homeDir/.xplanet/config

# The name of the desktop image
outputFile=$homeDir/.xplanet/xplanet.png

# Here are some options you may want to edit. Read `man xplanet` for
# a detailed explanation of each option.
xoptions="-num_times 1 -longitude 0 -latitude 0 -body earth \
	-projection rectangular -quality 100 -light_time -verbosity -1"

# Get the correct earth map
month=`/bin/date +%m`
/bin/ln -sf $homeDir/.xplanet/world/${month}.jpg $homeDir/.xplanet/earth.jpg

# Get the cloud map
python2 $homeDir/.xplanet/xplanet-download_clouds.py \
	$homeDir/.xplanet/clouds.jpg

# Run xplanet
xplanet -output $outputFile -geometry $geometry -config $configFile \
	$xoptions
 
echo $outputFile
