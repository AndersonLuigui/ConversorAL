# Usando uma imagem base do Node.js
FROM node:16

# Definir diretório de trabalho
WORKDIR /app

# Copiar os arquivos de configuração para dentro do container
COPY package*.json ./
RUN npm install

# Instalar o yt-dlp
RUN apt-get update && apt-get install -y python3-pip && pip3 install -U yt-dlp

# Copiar o restante dos arquivos do projeto
COPY . .

# Expor a porta em que o app irá rodar
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["npm", "start"]
