DELIMITER $$

CREATE PROCEDURE sp_ActualizarTelefonoPaciente(
    IN id_paciente INT,
    IN nuevo_telefono VARCHAR(20)
)
BEGIN
    UPDATE Pacientes
    SET telefono = nuevo_telefono
    WHERE id = id_paciente;

    INSERT INTO HistorialTelefonos (id_paciente, telefono_anterior, telefono_nuevo, fecha_cambio)
    SELECT id, telefono, nuevo_telefono, NOW()
    FROM Pacientes
    WHERE id = id_paciente;
END$$

DELIMITER ;