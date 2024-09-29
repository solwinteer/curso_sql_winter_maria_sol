CREATE VIEW v_PacientesPorGenero AS
SELECT 
    genero,
    COUNT(*) AS total_pacientes
FROM 
    Pacientes
GROUP BY 
    genero;