-- Vista para mostrar citas por doctor
CREATE VIEW v_CitasPorDoctor AS
SELECT 
    d.id AS id_doctor,
    d.nombre AS nombre_doctor,
    d.apellido AS apellido_doctor,
    c.fecha_hora AS fecha_cita,
    c.motivo AS motivo_cita
FROM 
    Doctores d
JOIN 
    Citas c ON d.id = c.id_doctor;