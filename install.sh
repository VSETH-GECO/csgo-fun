#!/bin/bash
sudo apt-get -y install steamcmd nfs-common
echo Installed steamcmd and nfs-common

mkdir ~/freenas
sudo mount -t nfs freenas:/mnt/RAID1/csgo ~/freenas
echo Mounted freenas

mkdir ~/csgofunserver
cp -r -v ~/freenas/cleanserver/* ~/csgofunserver
echo Copied CSGOclean to server

cp -r -v ~/freenas/csgofunserver ~/
echo Copied Files from git to server

cp -v -r ~/freenas/maps ~/csgofunserver/csgo
echo Copied map to csgo

sudo umount -f -l ~/freenas
echo Unmounted freenas

rmdir ~/freenas
echo Removed freenas dir

chmod +x ~/csgofunserver/update.sh
echo Made update.sh executable

chmod +x ~/csgofunserver/copyCfgs.sh
echo Made copyCfgs.sh executable

chmod +x ~/csgofunserver/start.sh
echo Made start.sh executable

ln -s ~/csgofunserver/start.sh ~/startFun.sh
echo Created simlink to start.sh