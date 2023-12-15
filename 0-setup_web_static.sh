#!/usr/bin/env bash
#  script that sets up web servers for the deployment of web_static

sudo apt-get update -y
sudo apt-get install nginx -y

sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

echo "<html><head></head><body>This is silas test page</body></html>"|sudo tee /data/web_static/releases/test/index.html

sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t\tautoindex off;\n\t}'/etc/nginx/sites-available/default
sudo service nginx restart
exit 0

