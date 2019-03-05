import wget
from pdf2image import convert_from_bytes
from PIL import Image


def internet_connected(host="8.8.8.8", port=53):

    try:
            socket.setdefaulttimeout(1)
            socket.socket(socket.AF_INET, socket.SOCK_STREAM).connect((host, port))
            return True
    except Exception as ex:
            pass
    return False

def getpdf():

    url = ("https://www.yr.no/sted/Norge/Nordland/Narvik/varsel.pdf")
    wget.download(url, '/home/kali/pythonProjects/Infoskjerm/langvarsel.pdf')

def pdfToImg():

    pages = convert_from_bytes('/home/kali/pythonProjects/Infoskjerm/langvarsel.pdf', 300)
    for page in pages:
            page.save('out.jpg', 'JPEG')


#def cropImg():
#    img = Image.open("out.jpg")
#    area = (100, 150, 2350, 1960)
#    cropped_img = img.crop(area)
#    cropped_img.save("weatherCropped.jpg")


getpdf()
pdfToImg()
#convert()
