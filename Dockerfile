# Imagem base Debian
FROM python:3.8-slim

# Atualizar e instalar dependências
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    ca-certificates \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs

# Instalar yt-dlp via pip
RUN pip3 install -U yt-dlp

# Criar diretório de trabalho
WORKDIR /app
COPY . /app

# Instalar dependências do Node.js (agora npm estará disponível)
RUN npm install

# Expor a porta
EXPOSE 3000

# Definir comando para rodar a aplicação
CMD ["npm", "start"]
