#!/usr/bin/env python3
import os
import sys
#  Fix menu and test out ansible ad-hoc scripts:  <24-03-19, Andre Hansen> #
"""Needs a shell script for the rssChecker with this shell command inside:
    stat -c '%y ~/output.xml'
    for simplisity call it rssCheck.sh and put it in the ~/scripts/ folder"""


def pingPi():
    """This is a command to check if all the hosts responds to ping"""
    os.system("ansible oscarsborg -m ping")


def rebootPi():
    """Reboot all pies"""
    os.system("ansible oscarsborg -m command -a reboot")


def updatePi(self):
    """Updates all pies"""
    os.system("ansible oscarsborg -m command -a sudo apt-get update")


def upgradePi(self):
    """Upgrades all pies"""
    os.system("ansible oscarsborg -m command -a sudo apt-get upgrade -y")

def rssChecker(self):
    """Checks when the RSS feed was last update"""
    os.system("ansible oscarsborg -m command -a bash ~/scripts/rssCheck.sh")


def forceUpdate(self):
    """Force pi-es to update the RSS feed"""
    os.system("ansible oscarsborg -m command -a bash ~/scripts/feedpi.py")


ans = True
while ans:
    print("""
    1.Ping all infoscreens
    2.Reboot all infoscreens
    3.Update RSS feed on all screens
    4.Exit/Quit
    """)
    ans = input("What would you like to do? ")
    if ans == "1":
        print("\n Running ansible ping module on all pi-es")
    elif ans == "2":
        print("\n Running ansible command module and reboots the pi-es")
    elif ans == "3":
        print("\n Force updates all the infoscreens")
    elif ans == "4":
        sys.exit("Goodbye")
    else:
        print("\n Not Valid Choice Try again")
