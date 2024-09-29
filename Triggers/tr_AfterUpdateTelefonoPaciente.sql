DELIMITER $$

CREATE TRIGGER tr_AfterUpdateTelefonoPaciente
AFTER UPDATE ON Pacientes
FOR EACH ROW
BEGIN
    -- Solo registrar cambios si el campo telefono ha sido modificado
    IF OLD.telefono != NEW.telefono THEN
        INSERT INTO HistorialTelefonos (id_paciente, telefono_anterior, telefono_nuevo)
        VALUES (NEW.id, OLD.telefono, NEW.telefono);
    END IF;
END$$

DELIMITER ;