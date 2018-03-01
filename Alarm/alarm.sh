
## atコマンドによって時間を指定
cd /home/rasp-yyh/smart-home/Alarm &&
echo "/usr/bin/mpg321 ./sound.mp3 ; ../WeatherForecast/weather.sh" | at $1

