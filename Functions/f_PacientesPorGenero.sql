CREATE FUNCTION f_PacientesPorGenero (@genero_param VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*)
    FROM Pacientes
    WHERE genero = @genero_param;
    
    RETURN @total;
END;