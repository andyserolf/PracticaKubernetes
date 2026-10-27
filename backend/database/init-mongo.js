db = db.getSiblingDB('andys_pipeart_nosql');

db.createCollection('historial_disenos_pedidos');
db.createCollection('bitacora_cambios_estado');

db.historial_disenos_pedidos.insertMany([
  {
    pedido_id: 1,
    version: 1,
    paleta_colores: ["#FFB7B2", "#FFDAC1", "#E2F0CB"],
    tipo_flores: "Girasoles y Margaritas",
    dedicatoria: "¡Feliz Cumpleaños!",
    accesorios: ["Moño satinado", "Tarjeta personalizada"],
    fecha_modificacion: new Date()
  }
]);

db.bitacora_cambios_estado.insertMany([
  {
    pedido_id: 1,
    estado_anterior: null,
    estado_nuevo: "Solicitado",
    usuario_id: 2,
    timestamp: new Date()
  }
]);