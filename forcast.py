import wget
from pdf2image import convert_from_path
from PIL import Image
import os

path = '/home/pi/weather/'
imgpath = '/home/pi/Pictures/'

def internet_connected(host="8.8.8.8", port=53):

    try:
            socket.setdefaulttimeout(1)
            socket.socket(socket.AF_INET, socket.SOCK_STREAM).connect((host, port))
            return True
    except Exception as ex:
            pass
    return False

def getpdf():
    os.system("wget https://www.yr.no/sted/Norge/Nordland/Narvik/varsel.pdf")

#def getpdf():
#    url =
#    wget.download(url, path + 'langvarsel.pdf')

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