
CREATE OR REPLACE VIEW view_colocacion AS
SELECT c.negocio_id, c.empresa_id, c.broker_id, c.consecutivo, n.folio_nota_cobertura, n.numero_negocio, n.nombre_asegurado, ec.nombre_empresa cedente, e.nombre_corto, e.nombre_empresa
,n.nombre_corto nombre_corto_negocio
,IF(c.consecutivo = 0, 'Cedente','Reaseguradores') ced_reasegs, eb.nombre_empresa broker, c.cobertura, c.num_dias_pago, 0 impuestos
,null garantia_id,c.colocacion_id,0 numero,null fecha,c.porc_participacion, c.prima100, 0 montoTotal, 0 saldo
,IF(c.consecutivo = 0, 'C','P') tipo_c_p,m.nombre_moneda,u.nombre_usuario,r.nombre_ramo,s.nombre_subramo,n.vigencia_fec_ini,n.vigencia_fec_fin
,d.endoso_id,d.numero numero_endoso,d.es_interno, d.fecha fecha_endoso, d.fecha_registro fecha_reg_endoso
,c.comision,getPrimaProrata(getPrimaBruta(c.prima100, c.porc_participacion),c.dias_prorata) primaBruta, getPrimaProrata(getComisionM(c.prima100, c.porc_participacion, c.comision),c.dias_prorata) comisionM
,getPrimaProrata(getPrimaNeta(c.prima100, c.porc_participacion, c.comision),c.dias_prorata) primaNeta,renovacion_neg_id, t.nombre_tipo_negocio
,c.numero_capa, getCapaLeyenda(c.limite_inicial,c.limite_final) capaLeyenda
,c.dias_prorata,getPrimaProrata(c.prima100, c.dias_prorata) primaPeriodo
FROM colocacion c 
JOIN negocio n ON c.negocio_id = n.negocio_id
JOIN empresa e ON c.empresa_id = e.empresa_id
JOIN moneda m ON n.moneda_id = m.moneda_id
JOIN usuario u ON n.usuario_id = u.usuario_id
JOIN subramo s ON n.subramo_id = s.subramo_id
JOIN ramo r ON n.ramo_id = r.ramo_id
JOIN empresa ec ON n.cedente_id = ec.empresa_id
JOIN tipo_negocio t ON n.tipo_negocio_id = t.tipo_negocio_id
LEFT JOIN endoso d ON c.endoso_id = d.endoso_id
LEFT JOIN empresa eb ON c.broker_id = eb.empresa_id
;


	CREATE OR REPLACE VIEW view_hc_rep AS
	SELECT 0 colocGar, vc.*, null corretaje
	FROM view_colocacion vc
	WHERE ABS(vc.primaNeta) > 0 
	UNION
	SELECT 1 colocGar, vh.*, null primaPeriodo, null corretaje
	FROM view_hc vh
	WHERE ABS(vh.montoTotal) > 0 AND ABS(vh.saldo) > 0
	UNION
	SELECT 2 colocGar,
	s.negocio_id, s.empresa_id, s.broker_id, -1 consecutivo, s.folio_nota_cobertura, s.numero_negocio, s.nombre_asegurado, s.cedente,
	s.nombre_corto, s.nombre_empresa, s.nombre_corto_negocio, 'Totales' ced_reasegs, null broker, null cobertura, null num_dias_pago, 0 impuestos,
	null garantia_id, 0 colocacion_id, 0 numero, null fecha, null porc_participacion, null prima100, 0 montoTotal, 0 saldo, 'N' tipo_c_p,
	s.nombre_moneda, null nombre_usuario, s.nombre_ramo, s.nombre_subramo, s.vigencia_fec_ini, s.vigencia_fec_fin,
	s.endoso_id, IFNULL(s.numero_endoso,0) numero_endoso, 
	null es_interno, null fecha_endoso, null fecha_reg_endoso, null comision, null primaBruta, null comisionM, null primaNeta, null renovacion_neg_id, s.nombre_tipo_negocio,
	null numero_capa, null capaLeyenda
	, s.dias_prorata, null primaPeriodo,
	SUM(
	CASE 
		WHEN s.primaNeta IS NOT NULL AND s.consecutivo = 0 THEN s.primaNeta
		WHEN s.primaNeta IS NOT NULL AND s.consecutivo > 0 THEN -s.primaNeta
		ELSE 0
	END) corretaje
	FROM view_colocacion s
	GROUP BY s.negocio_id, s.folio_nota_cobertura, s.endoso_id, s.numero_endoso
	;
	
