CREATE FUNCTION f_CitasProximas (@dias INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*)
    FROM Citas
    WHERE fecha_hora BETWEEN GETDATE() AND DATEADD(DAY, @dias, GETDATE());
    
    RETURN @total;
END;