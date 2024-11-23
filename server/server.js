const express = require("express");
const path = require("path");
const bodyParser = require("body-parser");
const { downloadVideo } = require("./videoService");

const app = express();

// Servir os arquivos estáticos (HTML, CSS, JS, assets) da pasta raiz
app.use(express.static(path.join(__dirname, "../")));

// Configurar o Body Parser para lidar com JSON
app.use(bodyParser.json());

// Endpoint para conversão
app.post("/convert", async (req, res) => {
    const { url } = req.body;

    if (!url) {
        return res.status(400).json({ error: "URL é obrigatória" });
    }

    try {
        const downloadUrl = await downloadVideo(url);
        res.json({ downloadUrl });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Erro ao processar o vídeo" });
    }
});

// INICIALIZADOR DA PORTA DINÂMICA (USANDO A VARIÁVEL PORT DO AMBIENTE)
const PORT = process.env.PORT || 3000;  // Usando a variável de ambiente PORT ou 3000 como fallback
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});

// SCRIPT PARA EXCLUIR O VÍDEO APÓS 1 MINUTO - CORREÇÃO DO BUG
function scheduleFileDeletion(filePath) {
    setTimeout(() => {
        fs.unlink(filePath, (err) => {
            if (err) {
                console.error(`Erro ao excluir arquivo: ${filePath}`, err);
            } else {
                console.log(`Arquivo excluído: ${filePath}`);
            }
        });
    }, 60000);
}
