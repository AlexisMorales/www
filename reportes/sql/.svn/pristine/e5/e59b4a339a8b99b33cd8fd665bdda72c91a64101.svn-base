

CREATE OR REPLACE VIEW view_sin_suma AS
SELECT negocio_id,numero_negocio,folio_nota_cobertura,nombre_asegurado,vigencia_fec_ini,vigencia_fec_fin
,cedente,simbolo_moneda,nombre_ramo,nombre_subramo
,cedente_id,moneda_id,nombre_moneda,nombre_empresa,empresa_id,porc_participacion
,colocacion_id,atencion_siniestro, email_siniestro, num_fax
,SUM(monto_final) suma_monto_final, SUM(monto_afectacion) suma_monto_afectacion, SUM(saldo) suma_saldo
,estatus_siniestro
FROM view_siniestro
GROUP BY colocacion_id
;
