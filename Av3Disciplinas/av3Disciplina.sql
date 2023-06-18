CREATE DATABASE av3
GO
USE av3
GO
CREATE TABLE aluno(
	ra INT identity(001, 1),
	nome VARCHAR(250),
	PRIMARY KEY(ra)
	)
GO
CREATE TABLE disciplina(
	codigo INT PRIMARY KEY,
	nome VARCHAR(100),
	sigla VARCHAR(4),			
	turno VARCHAR(1),				
	num_aulas INT
	)
GO
CREATE TABLE faltas(
	ra_aluno INT,
	codigo_disciplina INT,
	data DATE,
	presenca INT,
	FOREIGN KEY (ra_aluno) REFERENCES aluno,
	FOREIGN KEY (codigo_disciplina) REFERENCES disciplina,
	PRIMARY KEY(ra_aluno, codigo_disciplina, data)
	)

GO
CREATE TABLE avaliacao(
	codigo INT IDENTITY(1,1) PRIMARY KEY,
	tipo VARCHAR(25)
	)
GO
CREATE TABLE notas(
	ra_aluno INT,
	codigo_disciplina INT,
	codigo_avaliacao INT,
	nota DECIMAL(4, 2),
	FOREIGN KEY (ra_aluno) REFERENCES aluno,
	FOREIGN KEY (codigo_disciplina) REFERENCES disciplina,
	FOREIGN KEY (codigo_avaliacao) REFERENCES avaliacao,
	PRIMARY KEY(ra_aluno, codigo_disciplina, codigo_avaliacao)
	)

INSERT INTO disciplina VALUES
('4203010', 'Arquitetura e Organização de Computadores', 'AOC', 'T', 4),
('4203020', 'Arquitetura e Organização de Computadores', 'AOC', 'N', 4),
('4208010', 'Laboratório de Hardware', 'LH', 'T', 2),
('4226004', 'Banco de Dados', 'BD', 'T', 4),
('4213003', 'Sistemas Operacionais I', 'SOI', 'T', 4),
('4213013', 'Sistemas Operacionais I', 'SOI', 'N', 4),
('4233005', 'Laboratório de Banco de Dados', 'LBD', 'T', 4),
('5005220', ' Métodos Para a Produção do Conhecimento', 'MPC', 'T', 4)
GO
INSERT INTO avaliacao VALUES
('P1'),
('P2'),
('P3'),
('T'),
('Pre Exame'),
('Exame'),
('Monografia Resumida'),
('Monografia Completa')
GO
INSERT INTO aluno
VALUES
('Sophia Reynolds'),
('Oliver Mitchell'),
('Emma Turner'),
('Liam Price'),
('Ava Cunningham'),
('Noah Yates'),
('Isabella Hawkins'),
('Elijah Sims'),
('Mia Lawrence'),
('Jameson Harrison'),
('Charlotte Sullivan'),
('Benjamin Lawson'),
('Amelia Armstrong'),
('Lucas Johnston'),
('Harper Dixon'),
('Alexander Chambers'),
('Evelyn Ford'),
('William Knight'),
('Abigail Watts'),
('Michael Ross'),
('Elizabeth Butler'),
('Daniel Saunders'),
('Sofia Newman'),
('Henry Reid'),
('Scarlett Palmer'),
('Matthew Caldwell'),
('Avery Fuller'),
('Josephine Fleming'),
('Jackson Bates'),
('Victoria Sherman'),
('Samuel Fitzgerald'),
('Grace Doyle'),
('Sebastian Gordon'),
('Aria Hart'),
('David Murray'),
('Ella Watson'),
('Gabriel Carpenter'),
('Chloe Webster'),
('Ryan Porter'),
('Penelope Norris'),
('Johnston Holt'),
('Natalie Blake'),
('Isaac Fletcher'),
('Hazel Powers'),
('Christopher Ball'),
('Audrey Parsons'),
('Andrew Park'),
('Lucy McKenzie'),
('Nathan Hubbard'),
('Lily Miles')
GO
INSERT INTO notas (ra_aluno, codigo_disciplina, codigo_avaliacao, nota)
VALUES
(1, '4226004', 1, '9.3'),
(1, '4226004', 2, '6.0'),
(1, '4226004', 4, '8.3'),
(2, '4213013', 1, '2.5'),
(2, '4213013', 2, '6.3'),
(2, '4213013', 4, '9.7'),
(3, '4213013', 1, '8.9'),
(3, '4213013', 2, '9.0'),
(3, '4213013', 4, '6.8'),
(4, '4213013', 1, '3.5'),
(4, '4213013', 2, '10.0'),
(4, '4213013', 4, '0.5'),
(5, '4203020', 1, '7.9'),
(5, '4203020', 2, '4.6'),
(5, '4203020', 4, '9.5'),
(6, '4203020', 1, '4.9'),
(6, '4203020', 2, '5.8'),
(6, '4203020', 4, '6.8')

SELECT * FROM notas

-- Inserção de faltas
INSERT INTO faltas (ra_aluno, codigo_disciplina, data, presenca)
VALUES
(1, 4226004, '15/03/2023', 1),
(1, 4226004, '16/03/2023', 0),
(1, 4226004, '17/03/2023', 1),
(1, 4226004, '18/03/2023', 0),
(1, 4226004, '19/03/2023', 0),
(1, 4226004, '20/03/2023', 0),
(1, 4226004, '21/03/2023', 4),
(1, 4226004, '22/03/2023', 0),
(1, 4226004, '23/03/2023', 2),
(1, 4226004, '24/03/2023', 0),
(1, 4226004, '25/03/2023', 0),
(1, 4226004, '26/03/2023', 0),
(1, 4226004, '27/03/2023', 0),
(1, 4226004, '28/03/2023', 2),
(1, 4226004, '29/03/2023', 0),
(1, 4226004, '30/03/2023', 0),
(1, 4226004, '31/03/2023', 4),
(1, 4226004, '01/04/2023', 0),
(1, 4226004, '02/04/2023', 0),
(1, 4226004, '03/04/2023', 0),
(2, 4213013, '15/03/2023', 1),
(2, 4213013, '16/03/2023', 0),
(2, 4213013, '17/03/2023', 1),
(2, 4213013, '18/03/2023', 0),
(2, 4213013, '19/03/2023', 0),
(2, 4213013, '20/03/2023', 0),
(2, 4213013, '21/03/2023', 4),
(2, 4213013, '22/03/2023', 0),
(2, 4213013, '23/03/2023', 2),
(2, 4213013, '24/03/2023', 0),
(2, 4213013, '25/03/2023', 0),
(2, 4213013, '26/03/2023', 0),
(2, 4213013, '27/03/2023', 0),
(2, 4213013, '28/03/2023', 2),
(2, 4213013, '29/03/2023', 0),
(2, 4213013, '30/03/2023', 0),
(2, 4213013, '31/03/2023', 4),
(2, 4213013, '01/04/2023', 0),
(2, 4213013, '02/04/2023', 0),
(2, 4213013, '03/04/2023', 0),
(3, 4226004, '15/03/2023', 1),
(3, 4226004, '16/03/2023', 0),
(3, 4226004, '17/03/2023', 1),
(3, 4226004, '18/03/2023', 0),
(3, 4226004, '19/03/2023', 0),
(3, 4226004, '20/03/2023', 0),
(3, 4226004, '21/03/2023', 4),
(3, 4226004, '22/03/2023', 0),
(3, 4226004, '23/03/2023', 2),
(3, 4226004, '24/03/2023', 0),
(3, 4226004, '25/03/2023', 0),
(3, 4226004, '26/03/2023', 0),
(3, 4226004, '27/03/2023', 0),
(3, 4226004, '28/03/2023', 2),
(3, 4226004, '29/03/2023', 0),
(3, 4226004, '30/03/2023', 0),
(3, 4226004, '31/03/2023', 4),
(3, 4226004, '01/04/2023', 0),
(3, 4226004, '02/04/2023', 0),
(3, 4226004, '03/04/2023', 0)
SELECT * FROM FALTAS
--PROCEDURES
-- 1: Inserção de notas
CREATE PROCEDURE p_insereNotas(@aluno INT, @materia INT, @tipoAvaliacao INT, @nota DECIMAL(4,2)) 
AS
INSERT INTO notas VALUES 
(@aluno, @materia, @tipoAvaliacao, @nota)

-- 2: Inserção de faltas
CREATE PROCEDURE p_insereFaltas(@aluno INT, @materia INT, @dataAula DATE, @presenca INT)
AS
INSERT INTO faltas VALUES 
(@aluno, @materia, @dataAula, @presenca)

-- Verificar as notas
CREATE FUNCTION fn_verificaNotas(@media DECIMAL(4,2)) 
RETURNS VARCHAR(30) 
AS BEGIN
DECLARE @situacao VARCHAR(30)
 			IF(@media < 3) BEGIN
 					SET @situacao = 'Reprovado'
 			END
 			ELSE IF (@media >= 3 AND @media <6) BEGIN
 					SET @situacao = 'Exame'
 			END
 			ELSE IF (@media >= 6) BEGIN
 					SET @situacao = 'Aprovado'
 			END
		RETURN @situacao
END

-- 3: Apresentar em tela, a saída de uma UDF, com cursor, que apresenta um quadro com as notas da turma
CREATE FUNCTION fn_mediaFinal(@materia INT)
RETURNS @tblFinal TABLE (
	Matricula_Aluno INT,
	Aluno VARCHAR(250),
	Avaliacao1 DECIMAL(4,2),
	Avaliacao2 DECIMAL(4,2),
	Avaliacao3 DECIMAL(4,2),
	Trabalho DECIMAL(4,2),
	Exame DECIMAL(4,2),
	MediaFinal DECIMAL(4,2),
	Situacao VARCHAR(30)
) AS
BEGIN
	DECLARE @Matricula_Aluno INT 
	DECLARE @Aluno VARCHAR(250)
	DECLARE cursoraluno CURSOR FOR SELECT DISTINCT ra_aluno FROM notas WHERE codigo_disciplina = @materia
	OPEN cursoraluno
	FETCH NEXT FROM cursoraluno INTO @Matricula_Aluno
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @av1 DECIMAL(4,2)
		DECLARE @av2 DECIMAL(4,2)
		DECLARE @av3 DECIMAL(4,2)
		DECLARE @trabalho DECIMAL(4,2)
		DECLARE @exame DECIMAL(4,2)
		DECLARE @mediaParcial DECIMAL(4,2)
		DECLARE @mediaFinal DECIMAL(4,2)
		DECLARE @situacao VARCHAR(30)

		SET @Aluno = (SELECT nome FROM aluno WHERE ra = @Matricula_Aluno)

		IF (@materia = '4233005')
		BEGIN
			SET @av1 = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 1
			)

			SET @av2 = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 2
			)

			SET @av3 = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 3
			)

			SET @exame = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 6
			)

			SET @mediaParcial = ((@av1 + @av2 + @av3) / 3)
			SET @situacao = dbo.fn_verificaNotas(@mediaParcial)

			INSERT INTO @tblFinal (Matricula_Aluno, Aluno, Avaliacao1, Avaliacao2, Avaliacao3, Exame, MediaFinal, Situacao)
			VALUES (@Matricula_Aluno, @Aluno, @av1, @av2, @av3, @exame, @mediaParcial, @situacao)
		END
		ELSE IF (@materia IN ('4213003', '4213013'))
		BEGIN
			SET @av1 = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 1
			)

			SET @av2 = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 2
			)

			SET @trabalho = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 4
			)

			SET @exame = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 6
			)

			SET @mediaParcial = ((@av1 + @av2 + @trabalho) / 3)
			SET @situacao = dbo.fn_verificaNotas(@mediaParcial)

			INSERT INTO @tblFinal (Matricula_Aluno, Aluno, Avaliacao1, Avaliacao2, Trabalho, Exame, MediaFinal, Situacao)
			VALUES (@Matricula_Aluno, @Aluno, @av1, @av2, @trabalho, @exame, @mediaParcial, @situacao)
		END
		ELSE
		BEGIN
			SET @av1 = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 1
			)

			SET @av2 = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 2
			)

			SET @exame = (
				SELECT nota
				FROM notas
				WHERE ra_aluno = @Matricula_Aluno
				AND codigo_disciplina = @materia
				AND codigo_avaliacao = 6
			)

			SET @mediaParcial = ((@av1 + @av2) / 2)
			SET @situacao = dbo.fn_verificaNotas(@mediaParcial)

			INSERT INTO @tblFinal (Matricula_Aluno, Aluno, Avaliacao1, Avaliacao2, Exame, MediaFinal, Situacao)
			VALUES (@Matricula_Aluno, @Aluno, @av1, @av2, @exame, @mediaParcial, @situacao)
		END

		FETCH NEXT FROM cursoraluno INTO @Matricula_Aluno
	END

	CLOSE cursoraluno
	DEALLOCATE cursoraluno

	RETURN
END

SELECT * FROM fn_mediaFinal('4233005') -- labbd
SELECT * FROM fn_mediaFinal('4213003') -- soi t
SELECT * FROM fn_mediaFinal('4213013') -- soi n

INSERT INTO notas (codigo_avaliacao, codigo_disciplina, nota, ra_aluno)
VALUES(6, 4213013, 10.0, 2)
INSERT INTO notas (codigo_avaliacao, codigo_disciplina, nota, ra_aluno)
VALUES(6, 4213013, 5.0, 2)

-- Apresentar em tela, uma UDF com a saída das faltas
CREATE FUNCTION fn_verificaFaltas(@presenca INT) 
RETURNS VARCHAR(4) 
AS BEGIN
DECLARE @retorno VARCHAR(4)

			IF(@presenca =0) BEGIN
					SET @retorno = 'PPPP'
				END
				ELSE IF(@presenca = 1) BEGIN
					SET @retorno = 'PPPF'
				END
				ELSE IF(@presenca = 2) BEGIN
					SET @retorno = 'PPFF'
				END
				ELSE IF(@presenca = 3) BEGIN
					SET @retorno = 'PFFF'
				END
				ELSE IF(@presenca = 4 ) BEGIN
					SET @retorno = 'FFFF'
				END
RETURN @retorno
END
GO
CREATE FUNCTION fn_verificaContador(@presenca INT, @contador INT) RETURNS INT AS BEGIN
DECLARE @retorno INT
			IF(@presenca = '0') BEGIN
					SET @retorno = @contador
				END
				ELSE IF(@presenca = '1') BEGIN
					SET @retorno = @contador + 1		
				END
				ELSE IF(@presenca = '2') BEGIN
					SET @retorno = @contador + 2
				END
				ELSE IF(@presenca = '3') BEGIN
					SET @retorno = @contador + 3	
				END
				ELSE IF(@presenca = '4') BEGIN
					SET @retorno = @contador + 4
				END
RETURN @retorno
END

CREATE FUNCTION fn_cursorFaltas(@materia INT)
RETURNS @tblFaltas TABLE (
    Matricula_Aluno INT,
    Aluno VARCHAR(250),
    [DATA1] VARCHAR(4),
    [DATA2] VARCHAR(4),
    [DATA3] VARCHAR(4),
    [DATA4] VARCHAR(4),
    [DATA5] VARCHAR(4),
    [DATA6] VARCHAR(4),
    [DATA7] VARCHAR(4),
    [DATA8] VARCHAR(4),
    [DATA9] VARCHAR(4),
    [DATA10] VARCHAR(4),
    [DATA11] VARCHAR(4),
    [DATA12] VARCHAR(4),
    [DATA13] VARCHAR(4),
    [DATA14] VARCHAR(4),
    [DATA15] VARCHAR(4),
    [DATA16] VARCHAR(4),
    [DATA17] VARCHAR(4),
    [DATA18] VARCHAR(4),
    [DATA19] VARCHAR(4),
    [DATA20] VARCHAR(4),
    totFaltas INT
)
AS
BEGIN
    DECLARE @Matricula_Aluno INT
    DECLARE @Aluno VARCHAR(250)
    DECLARE @aula CHAR(10)
    DECLARE @falta INT
    DECLARE @contFalta INT
    DECLARE @faltaDia VARCHAR(4)
    DECLARE @totalFaltas INT

    SET @totalFaltas = 0

    DECLARE cursoraluno CURSOR FOR
    SELECT DISTINCT ra_aluno
    FROM faltas
    WHERE codigo_disciplina = @materia

    OPEN cursoraluno
    FETCH NEXT FROM cursoraluno INTO @Matricula_Aluno

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @contFalta = 1
        SET @Aluno = (SELECT nome FROM aluno WHERE ra = @Matricula_Aluno)

        INSERT INTO @tblFaltas (Matricula_Aluno, Aluno) VALUES (@Matricula_Aluno, @Aluno)

        DECLARE cursorfaltas CURSOR FOR
        SELECT DISTINCT CONVERT(CHAR(10), data, 103) AS data
        FROM faltas
        WHERE codigo_disciplina = @materia
            AND ra_aluno = @Matricula_Aluno

        OPEN cursorfaltas
        FETCH NEXT FROM cursorfaltas INTO @aula

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @falta = (SELECT presenca FROM faltas WHERE codigo_disciplina = @materia AND ra_aluno = @Matricula_Aluno AND CONVERT(CHAR(10), data, 103) = @aula)
            SET @faltaDia = dbo.fn_verificaFaltas(@falta)
            SET @totalFaltas = dbo.fn_verificaContador(@falta, @totalFaltas)

            IF (@contFalta <= 20)
            BEGIN
                UPDATE @tblFaltas SET
                    [DATA1] = CASE WHEN @contFalta = 1 THEN @faltaDia ELSE [DATA1] END,
                    [DATA2] = CASE WHEN @contFalta = 2 THEN @faltaDia ELSE [DATA2] END,
                    [DATA3] = CASE WHEN @contFalta = 3 THEN @faltaDia ELSE [DATA3] END,
                    [DATA4] = CASE WHEN @contFalta = 4 THEN @faltaDia ELSE [DATA4] END,
                    [DATA5] = CASE WHEN @contFalta = 5 THEN @faltaDia ELSE [DATA5] END,
                    [DATA6] = CASE WHEN @contFalta = 6 THEN @faltaDia ELSE [DATA6] END,
                    [DATA7] = CASE WHEN @contFalta = 7 THEN @faltaDia ELSE [DATA7] END,
                    [DATA8] = CASE WHEN @contFalta = 8 THEN @faltaDia ELSE [DATA8] END,
                    [DATA9] = CASE WHEN @contFalta = 9 THEN @faltaDia ELSE [DATA9] END,
                    [DATA10] = CASE WHEN @contFalta = 10 THEN @faltaDia ELSE [DATA10] END,
                    [DATA11] = CASE WHEN @contFalta = 11 THEN @faltaDia ELSE [DATA11] END,
                    [DATA12] = CASE WHEN @contFalta = 12 THEN @faltaDia ELSE [DATA12] END,
                    [DATA13] = CASE WHEN @contFalta = 13 THEN @faltaDia ELSE [DATA13] END,
                    [DATA14] = CASE WHEN @contFalta = 14 THEN @faltaDia ELSE [DATA14] END,
                    [DATA15] = CASE WHEN @contFalta = 15 THEN @faltaDia ELSE [DATA15] END,
                    [DATA16] = CASE WHEN @contFalta = 16 THEN @faltaDia ELSE [DATA16] END,
                    [DATA17] = CASE WHEN @contFalta = 17 THEN @faltaDia ELSE [DATA17] END,
                    [DATA18] = CASE WHEN @contFalta = 18 THEN @faltaDia ELSE [DATA18] END,
                    [DATA19] = CASE WHEN @contFalta = 19 THEN @faltaDia ELSE [DATA19] END,
                    [DATA20] = CASE WHEN @contFalta = 20 THEN @faltaDia ELSE [DATA20] END,
                    totFaltas = (SELECT SUM(presenca) FROM faltas WHERE codigo_disciplina = @materia AND ra_aluno = @Matricula_Aluno)
                WHERE Matricula_Aluno = @Matricula_Aluno
            END

            SET @contFalta = @contFalta + 1
            FETCH NEXT FROM cursorfaltas INTO @aula
        END

        CLOSE cursorfaltas
        DEALLOCATE cursorfaltas

        FETCH NEXT FROM cursoraluno INTO @Matricula_Aluno
    END

    CLOSE cursoraluno
    DEALLOCATE cursoraluno

    RETURN
END


SELECT * FROM fn_cursorFaltas('4233005') -- labbd
SELECT * FROM fn_cursorFaltas('4213003') -- soi t
SELECT * FROM fn_cursorFaltas('4213013') -- soi n

SELECT * from faltas where codigo_disciplina = '4213013'

insert into faltas values (1, 4213013, '17/06/2023', 1)
insert into faltas values (4, 4213013, '17/06/2023', 4)
insert into faltas values (4, 4213013, '18/06/2023', 2)
delete faltas where ra_aluno = 1