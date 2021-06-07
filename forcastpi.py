from pdf2image import convert_from_path
from PIL import Image
import os
import requests
import feedparser
import socket
import sys

# Change url to a yr location of your choice
url = 'https://www.yr.no/sted/Norge/Nordland/Narvik/Narvik/varsel.pdf'
home = '/home/pi/'
path = '/home/pi/newsAndForcast/'
# Imgpath is the output you want your picture to end up, should be same file as FEH picture folder uses
imgpath = '/home/pi/Pictures/'

# Grabs pdf from yr
def getpdf():
	r = requests.get(url)
	with open("langvarsel.pdf", "wb") as code:
	    code.write(r.content)

# Creates a jpg from the pdf file
def pdfToImg():
	pages = convert_from_path(path + 'langvarsel.pdf', 300)
	for page in pages:
		page.save(path + 'out.jpg', 'JPEG')

# Crop image to fit screen
def cropImg():
	img = Image.open("out.jpg")
	area = (100, 150, 2350, 1960)
	cropped_img = img.crop(area)
	cropped_img.save("weatherCropped.jpg")

# Move file to imgpath
def move():
	os.rename(path + "weatherCropped.jpg", imgpath + "forcast.jpg")
getpdf()
pdfToImg()
cropImg()
move()
