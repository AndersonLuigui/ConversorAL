#!/bin/bash

# Atualiza a lista de pacotes
apt-get update

# Instala o pip, caso não tenha
apt-get install -y python3-pip

# Instala o yt-dlp usando pip
pip3 install -U yt-dlp

# Adiciona o diretório /usr/local/bin ao PATH
echo 'export PATH=$PATH:/usr/local/bin' >> /etc/profile.d/yt-dlp.sh

# Aplica as alterações no PATH para a sessão atual
source /etc/profile.d/yt-dlp.sh
