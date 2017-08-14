


CREATE OR REPLACE VIEW view_garantia AS
SELECT c.negocio_id, c.empresa_id, n.folio_nota_cobertura, n.numero_negocio, n.nombre_asegurado, e.nombre_corto, e.nombre_empresa,
g.garantia_id,g.colocacion_id,g.afectacion_id,g.numero,g.fecha,g.prima,g.comision,g.impuestos,g.monto_total,g.saldo, g.comision_broker
,g.tipo_c_p,m.nombre_moneda,m.simbolo_moneda,n.moneda_id,u.nombre_usuario,r.nombre_ramo,s.nombre_subramo,n.vigencia_fec_ini,n.vigencia_fec_fin,IFNULL(a.monto,0) montoPago
,d.endoso_id,d.numero numeroEndoso,d.es_interno
,c.broker_id, b.nombre_empresa nombreEmpresaBroker
,n.usuarioCorreo_id, uc.correo_usuario, uc.nombre_usuario nombre_usuario_correo
,af.siniestro_id
FROM garantia g
JOIN colocacion c ON g.colocacion_id = c.colocacion_id
JOIN negocio n ON c.negocio_id = n.negocio_id
JOIN empresa e ON c.empresa_id = e.empresa_id
JOIN moneda m ON n.moneda_id = m.moneda_id
JOIN usuario u ON n.usuario_id = u.usuario_id
JOIN usuario uc ON n.usuarioCorreo_id = uc.usuario_id
JOIN subramo s ON n.subramo_id = s.subramo_id
JOIN ramo r ON n.ramo_id = r.ramo_id
LEFT JOIN aplicacion_garantia a ON g.garantia_id = a.garantia_id
LEFT JOIN endoso d ON g.endoso_id = d.endoso_id
LEFT JOIN empresa b ON c.broker_id = b.empresa_id
LEFT JOIN afectacion af ON g.afectacion_id = af.afectacion_id
;

