CREATE DATABASE ex_triggers_07
GO
USE ex_triggers_07
GO
CREATE TABLE cliente (
codigo		INT			NOT NULL,
nome		VARCHAR(70)	NOT NULL
PRIMARY KEY(codigo)
)
GO
CREATE TABLE venda (
codigo_venda	INT				NOT NULL,
codigo_cliente	INT				NOT NULL,
valor_total		DECIMAL(7,2)	NOT NULL
PRIMARY KEY (codigo_venda)
FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo)
)

GO
CREATE TABLE pontos (
codigo_cliente	INT					NOT NULL,
total_pontos	DECIMAL(4,1)		NOT NULL
PRIMARY KEY (codigo_cliente)
FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo)
)

/*
- Uma empresa vende produtos alimentícios
- A empresa dá pontos, para seus clientes, que podem ser revertidos em prêmios
- Para não prejudicar a tabela venda, nenhum produto pode ser deletado, mesmo que não venha mais a ser vendido
- Para não prejudicar os relatórios e a contabilidade, a tabela venda não pode ser alterada. 
- Ao invés de alterar a tabela venda deve-se exibir uma tabela com o nome do último cliente que comprou e o valor da 
última compra
- Após a inserção de cada linha na tabela venda, 10% do total deverá ser transformado em pontos.
- Se o cliente ainda não estiver na tabela de pontos, deve ser inserido automaticamente após sua primeira compra
- Se o cliente atingir 1 ponto, deve receber uma mensagem (PRINT SQL Server) dizendo que ganhou
*/

CREATE TRIGGER t_deleProduto ON venda
AFTER DELETE
AS 
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Não é possível excluir as vendas.', 16,1)
END

CREATE TRIGGER t_updtVenda ON venda
AFTER UPDATE
AS 
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Não é possível alterar as vendas.', 16,1)
END

DISABLE TRIGGER t_deleProduto ON venda
DISABLE TRIGGER t_updtVenda ON venda

CREATE TRIGGER t_exibirUltCliente on venda
AFTER UPDATE
AS
BEGIN
	
	ROLLBACK TRANSACTION

	DECLARE @tabela1 TABLE(
				nome	VARCHAR(200),
				valor	DECIMAL(7,2)
				)

	INSERT @tabela1(nome, valor)
	SELECT TOP 1 c.nome, v.valor_total
	FROM venda v, cliente c
	WHERE c.codigo = v.codigo_cliente
	ORDER BY codigo_venda DESC

	SELECT * FROM @tabela1

END

SELECT * FROM venda

UPDATE venda
SET valor_total = 11.00
WHERE codigo_venda = 1

SELECT * FROM venda



-- Após a inserção de cada linha na tabela venda, 10% do total deverá ser transformado em pontos.
-- Se o cliente ainda não estiver na tabela de pontos, deve ser inserido automaticamente após sua primeira compra
-- Se o cliente atingir 1 ponto, deve receber uma mensagem (PRINT SQL Server) dizendo que ganhou

CREATE TRIGGER t_insPontos ON venda
AFTER INSERT
AS 
BEGIN

	DECLARE @tabelaPontos TABLE(
				cod_cliente INT,
				total_pontos DECIMAL(4,1)
				)

	DECLARE @porcentagem	DECIMAL(7,2),
			@pontos			DECIMAL(4,1)

	SET @porcentagem = 0.10

		INSERT @tabelaPontos (cod_cliente, total_pontos) 
		SELECT codigo_cliente, valor_total * @porcentagem AS total
		FROM INSERTED
	
		INSERT INTO pontos (codigo_cliente, total_pontos)
		SELECT cod_cliente,total_pontos
		FROM @tabelaPontos

END

select * from cliente
select * from venda
select * from pontos

INSERT INTO cliente VALUES
(1,'Vitor'),
(2, 'Igor'),
(3,'Diego')

INSERT INTO venda VALUES
(1,1, 15.00),
(2,2, 10.00),
(3,3, 20.00)

delete venda
delete cliente
delete pontos