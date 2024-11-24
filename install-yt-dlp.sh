#!/bin/bash
# Atualiza a lista de pacotes
apt-get update

# Instala o pip3 se não estiver instalado
apt-get install -y python3-pip

# Instala o yt-dlp via pip
pip3 install -U yt-dlp --no-warn-script-location

# Adiciona /usr/local/bin ao PATH global
echo 'export PATH=$PATH:/usr/local/bin' >> /etc/profile.d/yt-dlp.sh

# Aplica o PATH no perfil atual
source /etc/profile.d/yt-dlp.sh

