from pdf2image import convert_from_path
pages = convert_from_path('/home/pi/weather/varsel.pdf', 300)

for page in pages:
	page.save('/home/pi/weather/out.jpg', 'JPEG')

