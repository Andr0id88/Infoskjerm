#!/bin/bash
# Simple script to create a screenshot of what is currently on shown on a screen, great for testing on pi-es that are on a remote location by running this with ssh.
mkdir -p ~/tempPics

MYFILE=./file.png
if [ -a $MYFILE ]
then rm $MYFILE
fi

cowsay "Screenshot taken of bygginn and m000ved to pishare home folder"
DISPLAY=:0 scrot file.png
mv file.png ~/tempPics/$HOSTNAME.png
