# Usando a imagem base do Python 3.9 (evitar problemas de versão)
FROM python:3.9-slim

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    ffmpeg \
    && apt-get clean

# Instalar o yt-dlp
RUN pip install --no-cache-dir yt-dlp

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o código para o contêiner
COPY . /app

# Instalar dependências do npm (se necessário para o seu projeto)
RUN npm install

# Definir o comando que será executado quando o contêiner for iniciado
CMD ["yt-dlp", "--cookies", "/path/to/cookies.txt", "-o", "/app/assets/video_%(id)s.%(ext)s", "https://www.youtube.com/shorts/vS3hTH8TenQ"]
