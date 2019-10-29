from pdf2image import convert_from_path
from PIL import Image
import os
import requests
import feedparser
import socket
import sys

url = 'https://www.yr.no/sted/Norge/Nordland/Narvik/Narvik/varsel.pdf'
home = '/home/pi/'
path = '/home/pi/newsAndForcast/'
imgpath = '/home/pi/Pictures/'

def getpdf():
	r = requests.get(url)
	with open("langvarsel.pdf", "wb") as code:
	    code.write(r.content)

def pdfToImg():
	pages = convert_from_path(path + 'langvarsel.pdf', 300)
	for page in pages:
		page.save(path + 'out.jpg', 'JPEG')

def cropImg():
	img = Image.open("out.jpg")
	area = (100, 150, 2350, 1960)
	cropped_img = img.crop(area)
	cropped_img.save("weatherCropped.jpg")

def move():
	os.rename(path + "weatherCropped.jpg", imgpath + "forcast.jpg")


    
getpdf()
pdfToImg()
cropImg()
move()
