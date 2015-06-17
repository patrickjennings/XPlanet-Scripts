#!/bin/sh

# Written by Patrick Jennings
# install.sh v0.2

# Installs the xplanet scripts to the directory:
# ${HOME}/.xplanet
XPLANET_DIR=${HOME}/.xplanet

command -v xplanet >/dev/null 2>&1 || { echo "Xplanet is required to be installed. Aborting." >&2; exit 1; }

echo "Initializing directories..."
mkdir ${XPLANET_DIR}

echo "Installing scripts..."
cp config ${XPLANET_DIR}/
cp xplanet-download_clouds.py ${XPLANET_DIR}/
cp xplanet-gnome2.sh ${XPLANET_DIR}/
cp xplanet.sh ${XPLANET_DIR}/

echo "Installing images..."
cp -r world ${XPLANET_DIR}/world

cp bump.jpg ${XPLANET_DIR}/bump.jpg
cp night.gif ${XPLANET_DIR}/night.gif
cp specular.jpg ${XPLANET_DIR}/specular.jpg
cp clouds.jpg ${XPLANET_DIR}/clouds.jpg

echo "**************"
echo "**Completed!**"
echo "**************"

