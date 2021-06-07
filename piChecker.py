#!/usr/bin/env python3
import os
import sys

#  Fix menu and test out ansible ad-hoc scripts:  <24-03-19, Andre Hansen> #
"""Needs a shell script for the rssChecker with this shell command inside:
    stat -c '%y ~/output.xml'
    for simplisity call it rssCheck.sh and put it in the ~/scripts/ folder"""

def pingAll():
    """This is a command to check if all the hosts responds to ping"""
    os.system("ansible all -m ping")

def rebootPi():
    """Reboot all pies"""
    os.system("ansible oscarsborg -m shell -a 'sudo reboot'")

def updatePi(self):
    """Updates all pies"""
    os.system("ansible oscarsborg -m command -a sudo apt-get update")

def upgradePi(self):
    """Upgrades all pies"""
    os.system("ansible oscarsborg -m command -a sudo apt-get upgrade -y")

def rssChecker(self):
    """Checks when the RSS feed was last update"""
    os.system("ansible oscarsborg -m command -a bash ~/scripts/rssCheck.sh")

def forceUpdateRss(self):
    """Force pi-es to update the RSS feed"""
    os.system("ansible oscarsborg -m command -a /home/pi/newsAndForcast/feedpi.py")

def forceUpdateForcast():
    """Force pi-es to update the RSS feed"""
    os.system("ansible oscarsborg -m command -a /home/pi/newsAndForcast/forcastpi.py")

ans = True
while ans:
    print("""
    1.Update git repo on all pies
    2.Ping all infoscreens
    3.Reboot all infoscreens
    4.Update RSS feed on all screens
    5.Update Forcast on all screens
    6.Logon raspberry pi-es with ssh
    q.Exit/Quit
    """)
    ans = input("What would you like to do? ")
    if ans == "1":
        print("\n Running ansible git playbook")
        os.system("ansible-playbook ~/myRepos/Infoskjerm/ansibleGitPi/playbook.yml")

    elif ans == "2":
        print("\n Starting to ping all the raspberries...")
        pingAll()

    elif ans == "3":
        print("\n Rebooting all the infoscreens...")
        rebootPi()

    elif ans == "4":
        print("\n Updating RSS feeds on all the infoscreens")
        forceUpdateRss()

    elif ans == "5":
        print("\n Updating weather forcast on all the infoscreens")
        forceUpdateForcast()

    elif ans == "6":
        ssh = True
        while ssh == True:
            print ("""
    1.Oscarsborg
    2.Solhaugen
        """)
            ssh = input("What school do you want to log on to?")
            if ssh == "1":
                sshans = True
                while sshans == True:
                    print("""
    1. Kantina
    2. Ekspidsjon
    3. Hovedinn
    4. Gyminn
    5. Byginn
    q. Back to main menu
                    """)
                    sshans = input("What pi do you want to log on to?")
                    if sshans == "1":
                        print("\nloging on to kantine infoscreen over ssh")
                        os.system("ssh kantina")
                    elif sshans == "2":
                        print("\nloging on to ekspidsjon infoscreen over ssh")
                        os.system("ssh ekspidisjon")

                    elif sshans == "3":
                        print("\nloging on to hovedinn infoscreen over ssh")
                        os.system("ssh hovedinngang")

                    elif sshans == "4":
                        print("\nloging on to gyminn infoscreen over ssh")
                        os.system("ssh gyminn")

                    elif sshans == "5":
                        print("\nloging on to bygginn infoscreen over ssh")
                        os.system("ssh bygginn")
                    elif sshans == "q":
                        sshans = False
                    else:
                        print("\n Not Valid Choice Try again")

            elif ssh == "2":
                sshans = True
                while sshans == True:
                    print("""
    1. Vestfloy
    2. Kantina
    3. Hovedinn
    4. Ostfloy
    5. Personal
    6. Testskjerm
    q. Back to main menu
                    """)
                    sshans = input("What pi do you want to log on to?")
                    if sshans == "1":
                        print("\nLoging on to Vestfloy infoscreen over ssh")
                        os.system("ssh svestfloy")
                    elif sshans == "2":
                        print("\nLoging on to Kantina infoscreen over ssh")
                        os.system("ssh skantine")

                    elif sshans == "3":
                        print("\nLoging on to Hovedinn infoscreen over ssh")
                        os.system("ssh shovedinn")

                    elif sshans == "4":
                        print("\nLoging on to Ostfloy infoscreen over ssh")
                        os.system("ssh shovedinn")

                    elif sshans == "5":
                        print("\nLoging on to Personal infoscreen over ssh")
                        os.system("ssh sostfloy")

                    elif sshans == "6":
                        print("\nLoging on to Testskjerm infoscreen over ssh")
                        os.system("ssh stestskjerm")

                    elif sshans == "q":
                        sshans = False
                    else:
                        print("\n Not Valid Choice Try again")

    elif ans == "q":
        sys.exit("Goodbye")

    else:
        print("\n Not Valid Choice Try again")
