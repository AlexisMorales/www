
CREATE OR REPLACE VIEW view_egresos AS
SELECT e.egreso_id, e.empresa_id, e.descripcion, e.monto, e.moneda_id, e.numero, e.tipo_c_t, e.fecha, e.fecha_registro
, em.nombre_empresa, m.nombre_moneda, m.simbolo_moneda 
, a.garantia_id, g.colocacion_id, c.negocio_id, g.fecha fecha_garantia, g.numero numero_garantia
, n.folio_nota_cobertura, n.nombre_asegurado
, a.fecha fecha_aplicacion
FROM egreso e
LEFT JOIN empresa em ON e.empresa_id = em.empresa_id
JOIN moneda m ON e.moneda_id = m.moneda_id
LEFT JOIN aplicacion_garantia a ON e.egreso_id = a.egreso_id
LEFT JOIN garantia g ON a.garantia_id = g.garantia_id
LEFT JOIN colocacion c ON g.colocacion_id = c.colocacion_id
LEFT JOIN negocio n ON c.negocio_id = n.negocio_id
;
