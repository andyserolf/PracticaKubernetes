const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Endpoint de salud (Health Check) exigido para Kubernetes Probes
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'UP', service: 'andys-pipeart-backend' });
});

// Endpoint principal del CRUD de Pedidos
app.get('/api/pedidos', (req, res) => {
  res.json({
    mensaje: "Bienvenido a la API de Andy's pipeArt",
    entidad: "Pedidos",
    estado: "Conectado correctamente al clúster Kubernetes"
  });
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});