USE videoclub;
DROP FUNCTION IF EXISTS Procedure;
DELIMITER //
CREATE FUNCTION Procedure(Peli SMALLINT UNSIGNED)
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE exemplarsVisualitzats SMALLINT UNSIGNED;

   SELECT   COUNT(*)
        INTO exemplarsVisualitzats
   FROM     EXEMPLARS
   WHERE    id_peli = Peli;

   RETURN exemplarsVisualitzats;
END//
DELIMITER ;
