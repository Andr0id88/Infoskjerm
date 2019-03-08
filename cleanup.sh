#!/bin/bash

cd ~/Infoskjerm/configs/ && mv .bashrc ~/
rm -rf Desktop/ Documents/ Music/ Public/ Templates/ Videos/ ;
cd ~/Infoskjerm && mv newsAndForcast/ scripts/ tempPics/ ../ && cd ~/Downloads && mv bakside\ raspberry.jpg tempPics/bakgrunn.jpg ;
killall tickr && cd ~/ && rm feed.py *.png output.xml rssfeed.sh screenshot.sh uptimePi vmelding ;
rm -rf weather/ Downloads/ ;
cd ~/Infoskjerm/configs && mv desktop-items-0.conf .config/pcmanfm/LXDE-PI/ ;
