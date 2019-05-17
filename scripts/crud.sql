USE Banco;  
GO  

CREATE PROCEDURE dbo.sp_CorrentistaIncluir    
@Nome nvarchar(50)

AS   

    SET NOCOUNT ON;  

	INSERT INTO tbCorrentista
	(Nome, DtCriacao, Saldo)
	VALUES (@Nome, GETDATE(), 0)

GO

CREATE PROCEDURE dbo.sp_CorrentistaAlterar
@IdCorrentista int,
@Nome nvarchar(50)

AS   

    SET NOCOUNT ON;  

	UPDATE tbCorrentista
	   SET Nome = @Nome
	 WHERE IdCorrentista = @IdCorrentista

GO

CREATE PROCEDURE dbo.sp_CorrentistaExcluir
@IdCorrentista int

AS   

    SET NOCOUNT ON;  

	DELETE tbCorrentista
	 WHERE IdCorrentista = @IdCorrentista

GO

CREATE PROCEDURE dbo.sp_CorrentistaConsultar
@IdCorrentista int

AS   

    SET NOCOUNT ON;  

	SELECT IdCorrentista, Nome, DtCriacao, Saldo 
      FROM tbCorrentista
	 WHERE IdCorrentista = @IdCorrentista

GO
