# Get started
Simple infoscreen by using FEH to loop through images located in a smb share that you can access remotly from a central machine.

## Background
The reason why this was created in the first place was that i liked Tickr's RSS feed look, and they did not support https RSS feeds, or at least they diden't at the time this was made.

## Todo
* Automate installation with an ansible playbook
* Add support for movie clips

### Dependencies:

##### Python3 dependencies:
* feedparser
* pdf2image
* pillow
* requests

##### Apt-get installations
* feh
* git
* poppler-utils
* samba
* samba-common-bin
* scrot
* unclutter
* xscreensaver

##### Tickr
* Download and install tickr for RSS feed
[Tickr offical](https://www.open-tickr.net/download.php)

Example configuration file can be found [here](https://github.com/Andr0id88/Infoskjerm/blob/master/configs/tickr-conf)

* Copy these commands to install packages needed

```
pip3 install feedparser pdf2image pillow requests --user
apt-get install feh poppler-utils scrot xscreensaver unclutter samba samba-common-bin -y
```
## Configuration
* Clone git repo to the raspberry pi
* Create a smb share on the raspberry pi were you want to store pictures for the infoscreen [Simple guide for setting up smb on a pi can be found here](https://pimylifeup.com/raspberry-pi-samba/)
* Run forcastpi.py and feedpi.py as a cronjob at the interval you want them to run, make sure they are located in $PATH or you will have to spesify full path in the cronjob

##### Cron-job example
```
0 0-23 * * * /my/repo/location/feedpi.py
0 0-23 * * * /my/repo/location/forcast.py
```

#### FEH script
[infotavle.sh](https://github.com/Andr0id88/Infoskjerm/blob/master/scripts/infotavle.sh)
This script loops through pictures at a given delay in seconds spesified with -D parameter, the -B parameter makes the background black outside of the picture. For more information check out man page for FEH.

#### Run feh script and tickr on boot
* Add these commands in the autostart file (LXDE) located in /etc/xdg/lxsession/LXDE-pi/autostart

```
@xscreensaver -no-splash
@unclutter -idle 15 -root
@./infotavle.sh
@tickr output.xml
```
