# Get started
Simple infoscreen by using FEH to loop through images located in a smb share that you can access remotly from a central machine.

### Dependancies:

##### PIP dependancies:
feedparser
pillow
requests
pdf2image

##### Apt-get installations
feh
poppler-utils
scrot
xscreensaver
unclutter
git

##### Tickr
* Download and install tickr for RSS feed
[Tickr offical](https://www.open-tickr.net/download.php)
Example configuration files are located [Here]()

* Copy these commands to install packages needed

```
pip3 install feedparser pdf2image pillow requests --user
apt-get install feh poppler-utils scrot xscreensaver unclutter samba samba-common-bin -y
```
## Configuration
* Clone git repo to the raspberry pi
* Create a smb share on the raspberry pi were you want to store pictures for the infoscreen [Simple guide for external drive SMB, you can also put it directly onto the SD card](https://pimylifeup.com/raspberry-pi-samba/)
* Run forcastpi.py and feedpi.py as a cronjob at the interval you want them to run, make sure they are located in $PATH or you will have to spesify full path in the cronjob

##### Cron-job example
```
0 0-23 * * * /my/repo/location/feedpi.py
0 0-23 * * * /my/repo/location/forcast.py
```

#### Run feh script and tickr on boot
* Add these commands in the autostart file (LXDE) located in /etc/xdg/lxsession/LXDE-pi/autostart

```
@xscreensaver -no-splash
@unclutter -idle 15 -root
@./infotavle.sh
@tickr output.xml
```
