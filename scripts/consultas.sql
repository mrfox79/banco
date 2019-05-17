USE Banco;  
GO  

CREATE PROCEDURE dbo.sp_ListarMovimentacao    
@dtInicio smalldatetime,   
@dtFim smalldatetime,
@Tipo nvarchar(1)

AS   

    SET NOCOUNT ON;  
	
    SELECT FirstName, LastName, Department  
      FROM tbMovimentacao  
     WHERE CONVERT(datetime, DtCriacao, 103) BETWEEN @dtInicio AND @dtFim  
       AND Tipo LIKE @Tipo;  

GO