#!/usr/bin/python3

from pdf2image import convert_from_path
from PIL import Image
import os
import requests
import feedparser
import socket
import sys

# Url to the forcast you want to create a picture from
url = 'https://www.yr.no/sted/Norge/Nordland/Narvik/Narvik/varsel.pdf'
# Temp location to store pdf file
temp = '/home/pi/newsAndForcast/temp/'
# Output path for where you want picture to go.
imgpath = '/home/pi/Pictures/'

def getpdf():
	r = requests.get(url)
	with open(temp + "langvarsel.pdf", "wb") as code:
	    code.write(r.content)

def pdfToImg():
	pages = convert_from_path(temp + 'langvarsel.pdf', 300)
	for page in pages:
		page.save(temp + 'out.jpg', 'JPEG')

def cropImg():
	img = Image.open(temp + "out.jpg")
	area = (100, 150, 2350, 1960)
	cropped_img = img.crop(area)
	cropped_img.save(temp + "weatherCropped.jpg")

def move():
	os.rename(temp + "weatherCropped.jpg", imgpath + "forcast.jpg")

getpdf()
pdfToImg()
cropImg()
move()
