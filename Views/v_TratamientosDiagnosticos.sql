CREATE VIEW v_TratamientosDiagnosticos AS
SELECT 
    p.id AS paciente_id,
    p.nombre AS paciente_nombre,
    p.apellido AS paciente_apellido,
    t.id AS tratamiento_id,
    t.descripcion AS tratamiento_descripcion,
    d.id AS diagnostico_id,
    d.descripcion AS diagnostico_descripcion,
    d.fecha AS diagnostico_fecha
FROM Pacientes p
JOIN Tratamientos t ON p.id = t.id_paciente
JOIN Diagnosticos d ON p.id = d.id_paciente;