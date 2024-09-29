SELECT 
    DATE_FORMAT(c.fecha_hora, '%Y-%m') AS mes,
    COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM 
    Citas c
GROUP BY 
    mes
ORDER BY 
    total_pacientes DESC
LIMIT 1;