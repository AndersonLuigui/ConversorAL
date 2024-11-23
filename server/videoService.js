const { exec } = require("child_process");
const path = require("path");
''
async function downloadVideo(url) {
    const uniqueName = `video_${Date.now()}.mp4`; // NOME ÚNICO BASEADO NA DATA
    const outputPath = path.resolve(__dirname, "../assets", uniqueName); // CAMINHO ONDE O VIDEO SERÁ SALVO

    return new Promise((resolve, reject) => {
        const command = `yt-dlp -o "${outputPath}" ${url}`; // COMANDO QUE VAI BAIXAR O VÍDEO PELA FUNÇÃO yt-dlp
        exec(command, (error) => {
            if (error) {
                reject(error);
            } else {
                resolve(`/assets/${uniqueName}`); // CAMINHO ÚNICO DO CLIENTE
            }
        });
    });
}

module.exports = { downloadVideo };