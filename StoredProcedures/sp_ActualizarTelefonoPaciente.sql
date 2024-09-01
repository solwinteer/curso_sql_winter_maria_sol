CREATE PROCEDURE sp_ActualizarTelefonoPaciente
@id_paciente INT,
@nuevo_telefono VARCHAR(20)
AS
BEGIN
    UPDATE Pacientes
    SET telefono = @nuevo_telefono
    WHERE id = @id_paciente;
END;

CREATE PROCEDURE sp_ObtenerCitasPorDoctor
@id_doctor INT,
@fecha_inicio DATETIME,
@fecha_fin DATETIME
AS
BEGIN
    SELECT * 
    FROM Citas
    WHERE id_doctor = @id_doctor
    AND fecha_hora BETWEEN @fecha_inicio AND @fecha_fin;
END;