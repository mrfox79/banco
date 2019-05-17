IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'Banco'
)
CREATE DATABASE [Banco]
