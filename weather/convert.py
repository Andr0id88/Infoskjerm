from PIL import Image
img = Image.open("/home/pi/weather/out.jpg")
area = (100, 150, 2350, 1960)
cropped_img = img.crop(area)
cropped_img.save("/home/pi/weather/weatherCropped.jpg")
