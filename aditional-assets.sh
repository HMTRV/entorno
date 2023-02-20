#!/bin/bash

# Instalar paquetes necesarios
sudo pacman -S wget curl tar

# Descargar Discord
wget -O discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
tar -xvzf discord.tar.gz
rm discord.tar.gz

# Descargar Google Chrome
wget -O google-chrome.tar.gz "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
sudo pacman -U google-chrome.tar.gz
rm google-chrome.tar.gz

# Descargar Notion
wget -O notion.tar.gz "https://desktop-release.notion-static.com/notion-2.0.16-amd64.deb"
sudo pacman -U notion.tar.gz
rm notion.tar.gz

# Descargar Sublime Text
wget -O sublime-text.tar.xz "https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.xz"
tar -xvf sublime-text.tar.xz
sudo mv sublime_text_3 /opt/
sudo ln -s /opt/sublime_text_3/sublime_text /usr/bin/sublime-text
rm sublime-text.tar.xz

echo "¡Listo! Discord, Google Chrome, Notion y Sublime Text han sido instalados."
