
--DROP FUNCTION getNumEndoso;


CREATE FUNCTION getNumEndoso (pEndosoId INTEGER, pEsInterno TINYINT, pNumEndoso TINYINT)
RETURNS VARCHAR(20) 
BEGIN
DECLARE regresa VARCHAR(20);
DECLARE tipo CHAR(1);

IF COALESCE(pEndosoId, 0) = 0 THEN
	SET regresa = '-';
ELSE 
	IF pEsInterno = 0 THEN
		SET tipo = 'E';
	ELSE
		SET tipo = 'I';
	END IF;
	SET regresa = CONCAT(tipo,pNumEndoso);
END IF;
RETURN regresa;
END

