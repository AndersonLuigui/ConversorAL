#!/bin/bash
apt-get update
apt-get install -y yt-dlp
yt-dlp -U  # Força a atualização do yt-dlp para a versão mais recente
