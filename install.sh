#!/bin/sh

# Written by Patrick Jennings
# install.sh v0.1

# Installs the xplanet scripts to the directory:
# ${HOME}/.xplanet
XPLANET_DIR=${HOME}/.xplanet
XPLANET_WORLD_DIR=${XPLANET_DIR}/world

echo "Initializing directories..."
mkdir ${XPLANET_DIR}
mkdir ${XPLANET_WORLD_DIR}

echo "Installing scripts..."
cp config ${XPLANET_DIR}/
cp xplanet-download_clouds.py ${XPLANET_DIR}/
cp xplanet-gnome2.sh ${XPLANET_DIR}/

echo "Downloading images..."
wget -O ${XPLANET_WORLD_DIR}/01.jpg http://veimages.gsfc.nasa.gov/7100/world.topo.bathy.200401.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/02.jpg http://veimages.gsfc.nasa.gov/7101/world.topo.bathy.200402.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/03.jpg http://veimages.gsfc.nasa.gov/7102/world.topo.bathy.200403.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/04.jpg http://veimages.gsfc.nasa.gov/7103/world.topo.bathy.200404.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/05.jpg http://veimages.gsfc.nasa.gov/7104/world.topo.bathy.200405.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/06.jpg http://veimages.gsfc.nasa.gov/7105/world.topo.bathy.200406.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/07.jpg http://veimages.gsfc.nasa.gov/7106/world.topo.bathy.200407.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/08.jpg http://veimages.gsfc.nasa.gov/7107/world.topo.bathy.200408.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/09.jpg http://veimages.gsfc.nasa.gov/7108/world.topo.bathy.200409.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/10.jpg http://veimages.gsfc.nasa.gov/7109/world.topo.bathy.200410.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/11.jpg http://veimages.gsfc.nasa.gov/7110/world.topo.bathy.200411.3x5400x2700.jpg
wget -O ${XPLANET_WORLD_DIR}/12.jpg http://veimages.gsfc.nasa.gov/7111/world.topo.bathy.200412.3x5400x2700.jpg

wget -O ${XPLANET_DIR}/bump.jpg http://veimages.gsfc.nasa.gov//8391/srtm_ramp2.world.5400x2700.jpg

wget -O ${XPLANET_DIR}/night.jpg http://veimages.gsfc.nasa.gov/1438/earth_lights.gif

wget -O ${XPLANET_DIR}/specular.jpg http://veimages.gsfc.nasa.gov/8392/gebco_bathy.5400x2700.jpg

echo "**************"
echo "**Completed!**"
echo "**************"

echo "Consider adding ${HOME}/.xplanet/xplanet-gnome2.sh to your crontab."

