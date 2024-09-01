CREATE VIEW v_PacientesCitas AS
SELECT 
    p.id AS paciente_id,
    p.nombre AS paciente_nombre,
    p.apellido AS paciente_apellido,
    c.id AS cita_id,
    c.fecha_hora,
    c.motivo
FROM Pacientes p
JOIN Citas c ON p.id = c.id_paciente;