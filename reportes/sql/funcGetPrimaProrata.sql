


CREATE FUNCTION getPrimaProrata (pPrima100 DECIMAL(14,2), pDiasProrata INTEGER)
RETURNS DECIMAL(14,2) 
BEGIN
DECLARE regresa  DECIMAL(14,2);
SET regresa = pPrima100 * pDiasProrata/365;
RETURN regresa;
END

