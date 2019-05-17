-- CRIA A TABELA DE CORRENTISTA
IF OBJECT_ID('dbo.tbCorrentista', 'U') IS NOT NULL
DROP TABLE dbo.tbCorrentista
GO

CREATE TABLE dbo.tbCorrentista
(
   IdCorrentista INT IDENTITY(1,1) PRIMARY KEY,
   Nome          [NVARCHAR](50)  NULL,
   DtCriacao   	 [SMALLDATETIME] NULL,
   Saldo      	 [MONEY] NOT NULL -- VALOR INICIAL 0 (ZERO)
);
GO

-- CRIA A TABELA DE MOVIMENTAÇÃO
IF OBJECT_ID('dbo.tbMovimentacao', 'U') IS NOT NULL
DROP TABLE dbo.tbMovimentacao
GO

CREATE TABLE dbo.tbMovimentacao
(
   IdMovimentacao INT IDENTITY(1,1) PRIMARY KEY, 
   IdCorrentista  INT NOT NULL,
   Tipo           [NVARCHAR](1) NOT NULL,
   DtCriacao   	  [SMALLDATETIME] NULL,
   Valor      	  [MONEY] NOT NULL
);
GO

-- LIGA AS TABELAS DE CORRENTISTA E MOVIMENTAÇÃO
ALTER TABLE tbMovimentacao
ADD CONSTRAINT fk_CorrentistaMovimentacao FOREIGN KEY (IdCorrentista) REFERENCES tbCorrentista (IdCorrentista)

GO

-- GATILHO DE ATUALIZAÇÃO DO SALDO DO CORRENTISTA
CREATE TRIGGER dbo.tgrAtaulizaSaldo ON tbMovimentacao FOR INSERT
AS

BEGIN

    DECLARE
    @ID int
    @Valor decimal(10,2),
 
    SELECT @ID = IdCorrentista, @Valor = Valor FROM INSERTED
 
    UPDATE tbCorrentista
	   SET Saldo = Saldo + @Valor
     WHERE IdCorrentista = @ID
	
END