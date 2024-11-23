document.getElementById("convertButton").addEventListener("click", async () => {
    const link = document.getElementById("videoLink").value;
    const status = document.getElementById("status");
    const downloadLink = document.getElementById("downloadLink");

    if (!link) {
        alert("Por favor, insira um link válido.");
        return;
    }

    status.textContent = "Processando...";

    try {
        const response = await fetch("https://conversoral-production.up.railway.app/convert", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ url: link }),
        });

        if (!response.ok) {
            throw new Error("Erro ao processar o vídeo");
        }

        const data = await response.json();
        status.textContent = "Conversão concluída!";
        downloadLink.href = data.downloadUrl;
        downloadLink.style.display = "block";
    } catch (err) {
        status.textContent = "Erro: " + err.message;
    }
});
