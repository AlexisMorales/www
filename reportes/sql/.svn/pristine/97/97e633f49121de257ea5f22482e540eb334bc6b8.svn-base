DELIMITER $$

DROP FUNCTION IF EXISTS getCapaLeyenda$$

CREATE FUNCTION getCapaLeyenda (pLimIni DECIMAL(14,2), pLimFin DECIMAL(14,2))
RETURNS VARCHAR(50) 
BEGIN
DECLARE regresa VARCHAR(50);
DECLARE limIni DOUBLE;
DECLARE leyIni VARCHAR(50);
DECLARE limFin DOUBLE;
DECLARE leyFin VARCHAR(50);
IF (pLimIni >= 1000000) THEN
	SET limIni = pLimIni/1000000;
	SET leyIni = concat(limIni, "M");
ELSE 
	SET limIni = pLimIni;
	SET leyIni = concat(limIni, "");
END IF ;
IF (pLimFin >= 1000000) THEN
	SET limFin = pLimFin/1000000;
	SET leyFin = "M";
ELSE 
	SET limFin = pLimFin;
	SET leyFin = "";
END IF ;
IF (pLimIni = 0) THEN
	SET leyIni = "Deduc";
END IF;
SET regresa = concat(limFin, leyFin, "xs", leyIni);
RETURN regresa;
END$$

DELIMITER ;


