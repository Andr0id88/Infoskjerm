#!/usr/bin/python3
import feedparser
import socket
import sys
import os

class RssFeed:
# Check if internett is connected, this is needed to prevent feed.py to create a empty output.xml file for Tickr when internet connection is lost
    def internet_connected(host="8.8.8.8", port=53):

        try:
                socket.setdefaulttimeout(1)
                socket.socket(socket.AF_INET, socket.SOCK_STREAM).connect((host, port))
                return True
        except Exception as ex:
                pass
        return False

    def writeToFile():
# Change this url to the RSS feed you want to parse into output.xml
        rsslinker = {
        ('https://www.nrk.no/nyheter/siste.rss'),
        ('https://www.nrk.no/nordland/toppsaker.rssS')
        }

        feeds = []
        for url in rsslinker:
                feeds.append(feedparser.parse(url))

        orig_stdout = sys.stdout
        f=open("output.xml",'w')
        sys.stdout = f

        for feed in feeds:
                for post in feed.entries:
                        feed ="               "+post.title+": "+post.description+"\n"
                        print(feed)
        sys.stdout = orig_stdout
        f.close()

    def move():
        os.rename("output.xml", "/home/pi/output.xml")
    if internet_connected():
        writeToFile()
        move()
    else:
        pass
