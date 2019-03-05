from pdf2image import convert_from_path
from PIL import Image
import os
import requests

url = 'https://www.yr.no/sted/Norge/Nordland/Narvik/Narvik/varsel.pdf'
path = '/home/kali/pythonProjects/Infoskjerm/'
imgpath = '/home/kali/pythonProjects/Infoskjerm/'


def internet_connected(host="8.8.8.8", port=53):

    try:
            socket.setdefaulttimeout(1)
            socket.socket(socket.AF_INET, socket.SOCK_STREAM).connect((host, port))
            return True
    except Exception as ex:
            pass
    return False

def getpdf():
    #Download the file contents in binary format
    r = requests.get(url)
    # open method to open a file on your system and write the contents
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


if internet_connected():
    getpdf()
    pdfToImg()
    cropImg()
    move()
else:
    pass
