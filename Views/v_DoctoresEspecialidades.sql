CREATE VIEW v_DoctoresEspecialidades AS
SELECT 
    d.id AS doctor_id,
    d.nombre AS doctor_nombre,
    d.apellido AS doctor_apellido,
    e.nombre AS especialidad_nombre
FROM Doctores d
JOIN Doctores_Especialidades de ON d.id = de.id_doctor
JOIN Especialidades e ON de.id_especialidad = e.id;
