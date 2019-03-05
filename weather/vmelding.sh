#!/bin/bash

wget -q https://www.yr.no/sted/Norge/Nordland/Narvik/Narvik/varsel.pdf -O /home/pi/weather/varsel.pdf
wait
python /home/pi/weather/pdftoImg.py
wait
python /home/pi/weather/convert.py
wait
mv /home/pi/weather/weatherCropped.jpg /home/pi/Pictures/
