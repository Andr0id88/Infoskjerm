#!/bin/bash

cd ~/ && rm -rf Desktop/ Documents/ Music/ Public/ Templates/ Videos/ python_games screenshot && cd ~/Infoskjerm && mv newsAndForcast/ scripts/ tempPics/ ../ && \
cd ~/Downloads && mv bakside\ raspberry.jpg ~/tempPics/bakgrunn.jpg && killall tickr && cd ~/ && rm -f vmelding feed.py *.png output.xml rssfeed.sh screenshot.sh uptimePi \
&& cd ~/newsAndForcast && python3 feedpi.py && python3 forcastpi.py && cd ~/ && rm -rf weather/ Downloads/ && \
cd ~/Infoskjerm/configs && mv desktop-items-0.conf ~/.config/pcmanfm/LXDE-PI/ && cd ~/Pictures && \
rm weatherCropped.jpg && sudo reboot

