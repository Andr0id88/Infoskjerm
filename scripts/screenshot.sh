#!/bin/bash

MYFILE=./file.png
if [ -a $MYFILE ]
then rm $MYFILE

fi

cowsay "Screenshot taken of bygginn and m000ved to pishare home folder"
DISPLAY=:0 scrot file.png
mv file.png ~/tempPics/bygginnSS.png
