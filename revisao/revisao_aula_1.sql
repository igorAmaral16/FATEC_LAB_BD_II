CREATE DATABASE revisao
GO
USE revisao
GO
CREATE TABLE aluno(
ra_aluno INT NOT NULL,
nome varchar(100) NOT NULL,
idade INT CHECK(idade > 0) NOT NULL,
PRIMARY KEY(ra_aluno)
);
GO
CREATE TABLE disciplina(
codigo_disciplina INT NOT NULL,
nome VARCHAR(80) NOT NULL,
carga_horaria INT CHECK(carga_horaria >= 32) NOT NULL,
PRIMARY KEY(codigo_disciplina)
);
GO
CREATE TABLE titulacao(
codigo_titulacao INT NOT NULL,
titulo VARCHAR(40),
PRIMARY KEY(codigo_titulacao)
);
GO
CREATE TABLE professor(
registro_professor INT NOT NULL,
nome VARCHAR(100) NOT NULL,
professor_titulacao INT NOT NULL,
FOREIGN KEY(professor_titulacao) REFERENCES titulacao(codigo_titulacao),
PRIMARY KEY(registro_professor)
);
GO
CREATE TABLE curso(
codigo_curso INT NOT NULL,
nome VARCHAR(50) NOT NULL,
area VARCHAR(100) NOT NULL,
PRIMARY KEY(codigo_curso)
);
GO
CREATE TABLE aluno_disciplina(
alunoRa INT NOT NULL,
disciplinaCodigo INT NOT NULL,
FOREIGN KEY(alunoRa) REFERENCES aluno(ra_aluno),
FOREIGN KEY(disciplinaCodigo) REFERENCES disciplina(codigo_disciplina),
PRIMARY KEY(alunoRa, disciplinaCodigo)
);
GO
CREATE TABLE disciplina_professor(
disciplinaCodigo INT NOT NULL,
professorRegistro INT NOT NULL,
FOREIGN KEY(disciplinaCodigo) REFERENCES disciplina(codigo_disciplina),
FOREIGN KEY(professorRegistro) REFERENCES professor(registro_professor),
PRIMARY KEY(disciplinaCodigo, professorRegistro)
);
GO
CREATE TABLE curso_disciplina(
cursoCodigo INT NOT NULL,
disciplinaCodigo INT NOT NULL,
FOREIGN KEY(cursoCodigo) REFERENCES curso(codigo_curso),
FOREIGN KEY(disciplinaCodigo) REFERENCES disciplina(codigo_disciplina),
PRIMARY KEY(cursoCodigo, disciplinaCodigo)
);
GO
INSERT INTO aluno VALUES 
(3416, 'DIEGO PIOVESAN DE RAMOS', 18),
(3423,'LEONARDO MAGALHÃES DA ROSA',17),
(3434,'LUIZA CRISTINA DE LIMA MARTINELI',20),
(3440,'IVO ANDRÉ FIGUEIRA DA SILVA',25),
(3443,'BRUNA LUISA SIMIONI',37),
(3448,'THAÍS NICOLINI DE MELLO',17),
(3457,'LÚCIO DANIEL TÂMARA ALVES',29),
(3459,'LEONARDO RODRIGUES',25),
(3465,'ÉDERSON RAFAEL VIEIRA',19),
(3466,'DAIANA ZANROSSO DE OLIVEIRA',21),
(3467,'DANIELA MAURER',23),
(3470,'ALEX SALVADORI PALUDO',42),
(3471,'VINÍCIUS SCHVARTZ',19),
(3472,'MARIANA CHIES ZAMPIERI',18),
(3482,'EDUARDO CAINAN GAVSKI',19),
(3483,'REDNALDO ORTIZ DONEDA',20),
(3499,'MAYELEN ZAMPIERON',22);
GO
INSERT INTO disciplina VALUES
(1,'Laboratório de Banco de Dados',80),
(2,'Laboratório de Engenharia de Software',80),
(3,'Programação Linear e Aplicações',80),
(4,'Redes de Computadores',80),
(5,'Segurança da informação',40),
(6,'Teste de Software',80),
(7,'Custos e Tarifas Logísticas',80),
(8,'Gestão de Estoques',40),
(9,'Fundamentos de Marketing',40),
(10,'Métodos Quantitativos de Gestão',80),
(11,'Gestão do Tráfego Urbano',80),
(12,'Sistemas de Movimentação e Transporte',40);
GO
INSERT INTO titulacao VALUES
(1,'Especialista'),
(2,'Mestre'),
(3,'Doutor');
GO
INSERT INTO professor VALUES
(1111,'Leandro',2),
(1112,'Antonio',2),
(1113,'Alexandre',3),
(1114,'Wellington',2),
(1115,'Luciano',1),
(1116,'Edson',2),
(1117,'Ana',2),
(1118,'Alfredo',1),
(1119,'Celio',2),
(1120,'Dewar',3),
(1121,'Julio',1);
GO
INSERT INTO curso VALUES
(1,'ADS','Ciências da Computação'),
(2,'Logística','Engenharia Civil');

SELECT * FROM disciplina_professor
SELECT * FROM curso_disciplina
SELECT * FROM aluno_disciplina

--------------------------------------------------
-- 1. COMO FAZER AS LISTAS DE CHAMADAS COM ra E NOME POR DISCIPLINA?--

SELECT al.ra_aluno, dc.nome
FROM aluno al, disciplina dc,  aluno_disciplina ad
WHERE al.ra_aluno = ad.alunoRa
AND dc.codigo_disciplina = dc.codigo_disciplina

--2. Fazer uma pesquisa que liste o nome das disciplinas e o nome dos professores que as ministram								

SELECT dc.nome, p.nome
FROM disciplina dc, professor p, disciplina_professor dp
WHERE dc.codigo_disciplina = dp.disciplinaCodigo
AND p.registro_professor = dp.professorRegistro

--3. Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o nome do curso								

SELECT dc.nome, c.nome
FROM disciplina dc,curso c, curso_disciplina cd
WHERE dc.codigo_disciplina = cd.disciplinaCodigo
AND c.codigo_curso = cd.cursoCodigo

--4. Fazer uma pesquisa que , dado o nome de uma disciplina, retorne sua área								

SELECT dc.nome, c.area
FROM disciplina dc,curso c, curso_disciplina cd
WHERE dc.codigo_disciplina = cd.disciplinaCodigo
AND c.codigo_curso = cd.cursoCodigo

--5. Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o título do professor que a ministra								

SELECT dc.nome, p.professor_titulacao
FROM disciplina dc, professor p, disciplina_professor dp
WHERE dc.codigo_disciplina = dp.disciplinaCodigo
AND p.registro_professor = dp.professorRegistro

--6. Fazer uma pesquisa que retorne o nome da disciplina e quantos alunos estão matriculados em cada uma delas								

SELECT dc.nome, COUNT(al.ra_aluno) AS qtd_aluno
FROM disciplina dc, aluno al, aluno_disciplina ad
WHERE dc.codigo_disciplina = ad.disciplinaCodigo
AND al.ra_aluno = ad.alunoRa
GROUP BY dc.nome

--7. Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor.  Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados													

SELECT dc.nome, p.nome, COUNT(dc.codigo_disciplina) AS codigo_disc	
FROM disciplina dc, professor p, disciplina_professor dp
WHERE dc.codigo_disciplina = dp.disciplinaCodigo
AND p.registro_professor = dp.professorRegistro
GROUP BY dc.nome, p.nome, dc.codigo_disciplina
HAVING dc.codigo_disciplina >= 5

--8. Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados que ministram aula nele. A coluna de ve se chamar quantidade													

SELECT c.nome
FROM curso c, disciplina dc, curso_disciplina cd, disciplina_professor dp
WHERE  c.codigo_curso = cd.cursoCodigo
AND dc.codigo_disciplina = cd.disciplinaCodigo
AND dp.professorRegistro IN (
		SELECT COUNT(p.registro_professor) AS qtd_prof
		FROM professor p
		GROUP BY p.registro_professor
		)
---------------

