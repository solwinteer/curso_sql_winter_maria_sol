SELECT 
    t.descripcion AS tratamiento,
    COUNT(t.id) AS veces_usado
FROM 
    Tratamientos t
GROUP BY 
    t.descripcion
ORDER BY 
    veces_usado DESC
LIMIT 1;