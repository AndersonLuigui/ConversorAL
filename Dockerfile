# Escolha da imagem base (debian ou outra que você precise)
FROM node:16-buster

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    python3.8-distutils \
    python3.8-venv \
    curl

# Instalando o yt-dlp via pip
RUN pip3 install -U yt-dlp

# Adicionando diretório de binários ao PATH
RUN echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
RUN source ~/.bashrc

# Resto das instruções para configurar o ambiente, copiar código, etc.
WORKDIR /app
COPY . /app

# Instalando dependências do Node.js (se houver)
RUN npm install

# Expondo a porta (caso necessário)
EXPOSE 3000

# Definindo o comando para rodar a aplicação (ajuste conforme necessário)
CMD ["npm", "start"]
