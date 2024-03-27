#!/bin/bash

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
sudo apt update
sudo apt install apache2 -y
echo
echo

# Apache service engedélyezése és azonnali indítása
echo "Apache service engedélyezése és azonnali indítása"
sleep 2
echo
echo
sudo systemctl enable apache2 && systemctl start apache2
echo
echo

# Dátum formázása az előre definiált formátumra
current_date=$(date +"%Y_%m_%d_%H_%M")

# apache_install_date.txt létrehozása és dátum beleírása
echo "$current_date" > apache_install_date.txt

echo "Az Apache webszerver telepítve, a  telepítési dátum mentve az aktuális könyvtárban található apache_install_date.txt fájlba."
sleep 5

