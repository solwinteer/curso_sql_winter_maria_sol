-- Crear el Trigger para registrar cambios en el teléfono de los pacientes
CREATE TRIGGER tr_AfterUpdateTelefonoPaciente
ON Pacientes
AFTER UPDATE
AS
BEGIN
    -- Solo registrar cambios si el campo telefono ha sido modificado
    IF UPDATE(telefono)
    BEGIN
        INSERT INTO HistorialTelefonos (id_paciente, telefono_anterior, telefono_nuevo)
        SELECT 
            i.id, -- ID del paciente
            d.telefono, -- Teléfono anterior
            i.telefono -- Nuevo teléfono
        FROM inserted i
        INNER JOIN deleted d ON i.id = d.id; -- Unir registros actualizados con los anteriores
    END
END;
