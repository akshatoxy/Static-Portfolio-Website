#!/bin/bash

sudo yum update
sudo yum install httpd -yum
sudo service start httpd
sudo yum install git
git clone https://github.com/akshatoxy/Static-Portfolio-Website.git
sudo cp -r Static-Portfolio-Website/* /var/www/html/