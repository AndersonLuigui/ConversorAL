#!/bin/bash
apt-get update
apt-get install -y python3-pip  # Instalar o pip, se não estiver instalado
pip3 install -U yt-dlp  # Instala o yt-dlp com a versão mais recente via pip
