SELECT 
    p.id AS id_paciente,
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente,
    d.nombre AS nombre_doctor,
    d.apellido AS apellido_doctor,
    c.fecha_hora AS fecha_cita
FROM 
    Citas c
JOIN 
    Pacientes p ON c.id_paciente = p.id
JOIN 
    Doctores d ON c.id_doctor = d.id
WHERE 
    c.fecha_hora >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
ORDER BY 
    c.fecha_hora DESC;