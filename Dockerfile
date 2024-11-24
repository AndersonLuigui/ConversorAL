# Escolha a imagem base com Python 3.8
FROM python:3.8-slim

# Atualize o sistema e instale o yt-dlp via pip
RUN pip install -U yt-dlp

# Resto das instruções para configurar o ambiente
WORKDIR /app
COPY . /app

# Instalando dependências do Node.js (se houver)
RUN npm install

# Expondo a porta (caso necessário)
EXPOSE 3000

# Definindo o comando para rodar a aplicação (ajuste conforme necessário)
CMD ["npm", "start"]
