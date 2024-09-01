CREATE PROCEDURE sp_InsertarDiagnostico
@id_paciente INT,
@id_doctor INT,
@fecha DATE,
@descripcion TEXT
AS
BEGIN
    INSERT INTO Diagnosticos (id_paciente, id_doctor, fecha, descripcion)
    VALUES (@id_paciente, @id_doctor, @fecha, @descripcion);
END;