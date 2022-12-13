#!/bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd

echo "<h1>The hostname of the server is $(hostname -f)</h1>" > /var/www/html/index.html
echo "<h2>Server is healthy</h2>" >/var/www/html/health.html