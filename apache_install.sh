#!/bin/bash
export TERM=xterm

# Repo update és Apache telepítés
clear
echo
echo
echo "Jenkins homework - Apache install script"
echo "Created by NT"
sleep 2
echo
echo
echo "Repo update és Apache telepítés"
sleep 2
sudo yum update
sudo yum install httpd -y
echo
echo

# Apache service engedélyezése és azonnali indítása
echo "Apache service engedélyezése és azonnali indítása"
sleep 2
echo
echo
sudo systemctl enable httpd && systemctl start httpd
echo
echo
# Apache service státuszának ellenőrzése
sudo systemctl status httpd
echo
echo
sleep 2
echo
echo

# Dátum formázása az előre definiált formátumra
current_date=$(date +"%Y_%m_%d_%H_%M")

# apache_install_date.txt létrehozása és dátum beleírása
echo "$current_date" > apache_install_date.txt

echo "Az Apache webszerver telepítve, a  telepítési dátum mentve az aktuális könyvtárban található apache_install_date.txt fájlba."
sleep 5

