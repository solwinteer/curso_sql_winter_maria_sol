DELIMITER $$

CREATE PROCEDURE sp_ObtenerCitasPorDoctor(
    IN id_doctor INT,
    IN fecha_inicio DATETIME,
    IN fecha_fin DATETIME
)
BEGIN
    SELECT * 
    FROM Citas
    WHERE id_doctor = id_doctor
    AND fecha_hora BETWEEN fecha_inicio AND fecha_fin;
END$$

DELIMITER ;