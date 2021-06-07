# Get started
Simple infoscreen by using FEH to loop through images located in a smb share that you can access remotly from a central machine.

## Dependancies:
Tickr: https://www.open-tickr.net/download.php

### Copy paste these commands to install packages needed or just run dependancies.sh located in the scripts folder
pip3 install feedparser pdf2image pillow requests --user
apt-get install feh poppler-utils scrot -y

#### PIP dependancies:
feedparser
pillow
requests
pdf2image

#### Apt-get installations
feh
poppler-utils
scrot
cowsay
git

## Configuration
* Create a smb share on the raspberry pi were you want to store pictures for the infoscreen
* Download the git repo to the raspberry pi and copy over newsAndForcast folder
*
*
