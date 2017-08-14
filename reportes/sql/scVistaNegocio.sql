
CREATE OR REPLACE VIEW view_negocio AS
SELECT 	n.numero_negocio
	,	n.folio_nota_cobertura
	,	n.nombre_asegurado
	,	n.vigencia_fec_ini
	,	n.vigencia_fec_fin
	,	e.nombre_empresa
	,	en.nombre_estatus	
	,	m.nombre_moneda
	,	s.nombre_ramo
	,	u.nombre_usuario
	,    n.usuario_id
	,	n.plazo
	,	n.recordatorio
	,	n.estatus_negocio_id
	,	getNumEndoso(n.endoso_id, ed.es_interno, ed.numero) AS endoso
FROM		negocio n
INNER JOIN empresa e ON n.cedente_id = e.empresa_id
INNER JOIN estatus_negocio en ON n.estatus_negocio_id = en.estatus_negocio_id
INNER JOIN moneda m ON n.moneda_id = m.moneda_id 
INNER JOIN ramo s ON n.ramo_id = s.ramo_id
INNER JOIN usuario u ON n.usuario_id = u.usuario_id
LEFT JOIN endoso ed ON n.endoso_id = ed.endoso_id
;




