
CREATE OR REPLACE VIEW view_hc_rep AS
SELECT 0 colocGar, c.negocio_id, c.empresa_id, c.broker_id, c.consecutivo, n.folio_nota_cobertura, n.numero_negocio, n.nombre_asegurado, ec.nombre_empresa cedente, e.nombre_corto, e.nombre_empresa
,n.nombre_corto nombre_corto_negocio
,IF(c.consecutivo = 0, 'Cedente','Reaseguradores') ced_reasegs, eb.nombre_empresa broker, c.cobertura, c.num_dias_pago, 0 impuestos
,null garantia_id,c.colocacion_id,0 numero,null fecha,c.porc_participacion, c.prima100, 0 montoTotal, 0 saldo
,IF(c.consecutivo = 0, 'C','P') tipo_c_p,m.nombre_moneda,u.nombre_usuario,r.nombre_ramo,s.nombre_subramo,n.vigencia_fec_ini,n.vigencia_fec_fin
,d.endoso_id,d.numero numero_endoso,d.es_interno, d.fecha fecha_endoso, d.fecha_registro fecha_reg_endoso
,c.comision,getPrimaBruta(c.prima100, c.porc_participacion) primaBruta, getComisionM(c.prima100, c.porc_participacion, c.comision) comisionM
,getPrimaNeta(c.prima100, c.porc_participacion, c.comision) primaNeta,renovacion_neg_id, t.nombre_tipo_negocio
,c.numero_capa
FROM colocacion c 
JOIN negocio n ON c.negocio_id = n.negocio_id
JOIN empresa e ON c.empresa_id = e.empresa_id
JOIN moneda m ON n.moneda_id = m.moneda_id
JOIN usuario u ON n.usuario_id = u.usuario_id
JOIN subramo s ON n.subramo_id = s.subramo_id
JOIN ramo r ON s.ramo_id = r.ramo_id
JOIN empresa ec ON n.cedente_id = ec.empresa_id
JOIN tipo_negocio t ON n.tipo_negocio_id = t.tipo_negocio_id
LEFT JOIN endoso d ON c.endoso_id = d.endoso_id
LEFT JOIN empresa eb ON c.broker_id = eb.empresa_id
UNION
SELECT 1 colocGar, vh.* from view_hc vh
;