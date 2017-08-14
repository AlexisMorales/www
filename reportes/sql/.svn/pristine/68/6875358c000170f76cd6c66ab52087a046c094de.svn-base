
CREATE OR REPLACE VIEW view_siniestro AS
SELECT s.siniestro_id, n.negocio_id, n.numero_negocio, n.folio_nota_cobertura, n.nombre_asegurado,n.vigencia_fec_ini, n.vigencia_fec_fin
,e.nombre_empresa cedente, m.simbolo_moneda,r.nombre_ramo,sr.nombre_subramo, n.cedente_id, n.moneda_id, m.nombre_moneda
,em.nombre_empresa, c.empresa_id
,s.numero_siniestro, s.fecha_siniestro, s.fec_actualizacion, s.estatus_siniestro, s.usuario_id
,s.perdida_al100_fin, s.deducible_al100_fin, s.gastos_al100_fin, s.salvamentos_al100_fin
,getPerdidaTotal(s.deducible_al100_fin, s.perdida_al100_fin, s.gastos_al100_fin, s.salvamentos_al100_fin) monto_final
,c.porc_participacion, a.monto monto_afectacion
,IFNULL(g.monto_total,0) - IFNULL(g.saldo,0) monto_pago, IFNULL(g.saldo,0) saldo
,s.consecutivo, s.fecha_reportado, s.referencia
,c.colocacion_id, a.afectacion_id
,(s.perdida_al100_fin * c.porc_participacion / 100) perdida_participacion
,em.atencion_siniestro, em.email_siniestro, em.num_fax
FROM siniestro s
JOIN negocio n ON s.negocio_id = n.negocio_id
JOIN empresa e ON n.cedente_id = e.empresa_id
JOIN moneda m ON s.moneda_id = m.moneda_id
JOIN subramo sr ON n.subramo_id = sr.subramo_id
JOIN ramo r ON n.ramo_id = r.ramo_id
JOIN afectacion a ON s.siniestro_id = a.siniestro_id
JOIN colocacion c ON a.colocacion_id = c.colocacion_id
JOIN empresa em ON c.empresa_id = em.empresa_id
LEFT JOIN garantia g ON a.afectacion_id = g.afectacion_id
;

