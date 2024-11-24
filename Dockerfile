# Use uma imagem base com Python
FROM python:3.8-slim

# Defina o diretório de trabalho
WORKDIR /app

# Instale as dependências
RUN apt-get update && apt-get install -y \
    curl \
    ffmpeg \
    && pip install --no-cache-dir yt-dlp

# Copie o restante dos arquivos para o contêiner
COPY . /app

# Defina o comando padrão do contêiner, mas permitindo que você passe novos parâmetros ao rodar o contêiner
CMD ["yt-dlp", "--cookies", "/app/cookies.txt", "-o", "/app/assets/%(id)s.%(ext)s", "https://www.youtube.com/shorts/vS3hTH8TenQ"]
