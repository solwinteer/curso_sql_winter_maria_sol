DELIMITER $$

CREATE FUNCTION f_PacientesPorGenero(genero_param VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM Pacientes
    WHERE genero = genero_param;
    
    RETURN total;
END$$

DELIMITER ;