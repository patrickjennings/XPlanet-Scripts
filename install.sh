#!/bin/sh
# Written by Patrick Jennings
# https://github.com/patrickjennings/XPlanet-Scripts
# install.sh v0.3

# Installs the xplanet scripts into this directory.
XPLANETDIR="$HOME/.xplanet"

echo "Initializing directory $XPLANETDIR"
mkdir -p "$XPLANETDIR"

echo "Installing script into $XPLANETDIR"
cp xplanet.sh "${XPLANETDIR}/"

echo "Copying images into $XPLANETDIR"
cp -r world "${XPLANETDIR}/world"

for FILE in "bump.jpg night.gif specular.jpg clouds.jpg";
do
    cp $FILE "${XPLANETDIR}/$FILE"
done

echo "Success!"
