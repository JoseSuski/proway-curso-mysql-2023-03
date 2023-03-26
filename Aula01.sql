-- Consuktar bancos de dados criados
SHOW SCHEMAS;
 
-- Apagar o banco de dados que foi criado
DROP DATABASE IF EXISTS curso_mysql;

-- Criar o banco de dados que será utilizado no curso
CREATE DATABASE IF NOT EXISTS curso_mysql;

-- Definir o banco de dados que será executado as consultas(queries)
USE curso_mysql;

-- Consultar as tabelas do banco de dados utilizado(vulgo comando USE curso_mysql)
SHOW TABLES;

-- Criar tabela para armazenar os registros dos alunos
CREATE TABLE alunos(
    -- AUTO_INCREMENT vai fazer o id começar com e depois incrementar em 1 a cada registro
    -- NOT NULL coluna que é obrigatório informar valor
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL -- VARCHAR(100) coluna com no máximo 100 caracteres
);

-- Consultar todos os registros da tabela de alunos
SELECT 
    id,
    nome
    FROM alunos;

-- Criar um registro na tabela de alunos
INSERT INTO alunos (nome) VALUE ("José");

-- Apagar TODOS os registros da tabela;
DELETE FROM alunos;

-- Consultar as colunas da tabelas
DESCRIBE alunos;
-- +-------+--------------+------+-----+---------+----------------+
-- | Field | Type         | Null | Key | Default | Extra          |
-- +-------+--------------+------+-----+---------+----------------+
-- | id    | int          | NO   | PRI | NULL    | auto_increment |
-- | nome  | varchar(100) | NO   |     | NULL    |                |
-- +-------+--------------+------+-----+---------+----------------+

-- Redefinir o AUTO_INCREMENT e apagar todos os registros da tabela,
-- porém não pode ter FK relacionada a esta tabela
TRUNCATE TABLE alunos;

INSERT INTO alunos (nome) VALUE ("José");
INSERT INTO alunos (nome) VALUE ("Luiz");
INSERT INTO alunos (nome) VALUE ("Bruno");
INSERT INTO alunos (nome) VALUE ("Lucas");
INSERT INTO alunos (nome) VALUE ("Jardel");
INSERT INTO alunos (nome) VALUE ("Zaqueu");
INSERT INTO alunos (nome) VALUE ("João");

-- Apagar registro do João filtrando pelo nome "João"
DELETE FROM alunos WHERE nome = "João";
-- Apagar o registro do João filtrando pelo id 7
DELETE FROM alunos WHERE id = 7;

-- Consultar quantidade de regsitros da tabela
SELECT COUNT(id) FROM alunos;

-- Criar tabela de professores
CREATE TABLE professores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    valor_hora FLOAT(5,2) -- cinco números, sendo dois na parte decimal
);

-- Criar registros da tabela professores
INSERT INTO professores (nome, valor_hora) VALUE ("Francisco", 53.00);
INSERT INTO professores (nome, valor_hora) VALUE ("Javeiro", 80.35);
INSERT INTO professores (nome, valor_hora) VALUE ("Rubens", 75.00);
INSERT INTO professores (nome, valor_hora) VALUE ("Pablo", 60.00);
INSERT INTO professores (nome, valor_hora) VALUE ("Pamela", 100.00);

-- Consultar registros de professores
SELECT id, nome, valor_hora FROM professores;

-- Criar tabela de cursos
CREATE TABLE cursos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    carga_horaria INT
);

-- Criar registros da tabela cursos
 INSERT INTO cursos (nome, carga_horaria) VALUE ("MySQL", 28);
 INSERT INTO cursos (nome, carga_horaria) VALUE ("C#", 40);
 INSERT INTO cursos (nome, carga_horaria) VALUE ("Python", 39);
 INSERT INTO cursos (nome, carga_horaria) VALUE ("Java", 41);
 INSERT INTO cursos (nome, carga_horaria) VALUE ("HTML, CSS", 32);
 INSERT INTO cursos (nome, carga_horaria) VALUE ("React", 52);

-- Consultar registros de cursos
SELECT id, nome, carga_horaria FROM cursos;

-- Consultar registros de cursos em ordem crescente da coluna nome
SELECT id, nome, carga_horaria FROM cursos ORDER BY nome ASC;

-- Consultar registros de cursos em ordem decrescente da coluna nome
SELECT id, nome, carga_horaria FROM cursos ORDER BY nome DESC;

-- Consultar registros de cursos em que a carga_horaria é maior ou igual a 40 horas
-- Ordenando pela carga_horaria en ordem crescente
SELECT id, nome, carga_horaria FROM cursos 
    WHERE carga_horaria >= 40 
    ORDER BY carga_horaria ASC;

-- Operadores relacioanais
-- IGUAL =
-- DIFERENTE != <>
-- MENOR <
-- MENOR OU IGUAL <=
-- MAIOR >
-- MAIOR OU IGUAL >=

-- Consultar a menor carga horária
SELECT MIN(carga_horaria) FROM CURSOS;

-- Consultar a maior carga horária
SELECT MAX(carga_horaria) FROM CURSOS;

-- Consultar soma das cargas horárias
SELECT SUM(carga_horaria) from cursos;

-- Consultar as médias das cargas horárias
SELECT SUM(carga_horaria)/COUNT(id) from cursos;
SELECT AVG(carga_horaria) FROM cursos;

-- Consultar média de cargas horárias maiores que 40h
SELECT 
    AVG(carga_horaria) AS "Média de carga horária de cursos > 40h"
    FROM cursos WHERE carga_horaria > 40;

-- Consultar tamanho do texto dos registros das tabelas
SELECT LENGTH(nome), nome FROM cursos;

-- Criar coluna na tabela de alunos para armazenar a data de nascimento
ALTER TABLE alunos ADD COLUMN data_nascimento DATE;

-- Consultar a data de nascimento dos alunos
SELECT id, nome, data_nascimento FROM alunos;

-- Atualiazar a data de nascimento do José
UPDATE alunos SET data_nascimento='2000-06-28' WHERE id = 1;
UPDATE alunos SET data_nascimento='2004-10-27' WHERE id = 2;
UPDATE alunos SET data_nascimento='1981-10-18' WHERE id = 3;
UPDATE alunos SET data_nascimento='2000-01-01' WHERE id = 4;
UPDATE alunos SET data_nascimento='1996-07-27' WHERE id = 5;
UPDATE alunos SET data_nascimento='2000-01-02' WHERE id = 6;

-- Consultar as datas de nascimento da tabela
SELECT
    DATE_FORMAT(data_nascimento, "%d/%m/%Y") AS 'Data de nascimento' 
    FROM alunos;

-- Consultar o ano da data de nascimento
SELECT YEAR(data_nascimento) FROM alunos;

-- Consultar o mês da data de nascimento
SELECT MONTH(data_nascimento) FROM alunos;

-- Consultar o dia da data de nascimento
SELECT DAY(data_nascimento) FROM alunos;

-- Consultar o nome e data de nascimento concatenados
SELECT CONCAT(nome," ", data_nascimento) FROM alunos;

-- Consultar o nome e data de nascimento, de alunos nascidos depois de 1999
-- ordenando por múltiplas colunas
SELECT nome, data_nascimento
    FROM alunos
    WHERE YEAR(data_nascimento) >= 2000
    ORDER BY YEAR(data_nascimento) ASC, MONTH(data_nascimento) ASC, DAY(data_nascimento) ASC

-- OPERADOR LÓGICO AND
-- V e V => V
-- V e F => F
-- F e V => F
-- F e F => F

-- Consultar nome dos alunos nascidos entre 1990 e 1999
SELECT id, nome, data_nascimento 
    FROM alunos
    WHERE
        YEAR(data_nascimento) >= 1990 AND
        YEAR(data_nascimento) <= 1999;

-- OPERADOR LÓGICO OR
-- V ou V => V
-- V ou F => V
-- F ou V => V
-- F ou F => F

-- Consultar os cursos com nome C# ou Python
SELECT id, nome FROM cursos WHERE nome = "C#" OR nome = "Python";

-- Consultar os cursos com nome C#, Python ou Java
SELECT id, nome FROM cursos WHERE nome IN("C#", "Python", "Java");

--Consultar os cursos com o nome diferente de C# e Python e Java (SEM NOT IN)
SELECT id, nome FROM cursos WHERE nome !="C#" AND nome!="Python" AND nome!= "Java";

--Consultar os cursos com o nome diferente de C# e Python e Java (COM NOT IN)
SELECT id, nome FROM cursos WHERE nome NOT IN("C#", "Python", "Java");

-- Consultar os cursos com carga horária entre 40 e 45 horas
SELECT id, nome, carga_horaria
    FROM cursos
    WHERE carga_horaria >= 40 AND carga_horaria <= 45; -- Sem Between

SELECT id, nome, carga_horaria 
    FROM cursos
    WHERE carga_horaria BETWEEN 40 AND 45; -- Com Between

-- Consultar os cursos limitados a dois registros
SELECT * FROM cursos LIMIT 2;

-- Consultar os cursos limitados a dois registros da primeira página
SELECT * FROM cursos LIMIT 0, 2;
-- +----+-------+---------------+
-- | id | nome  | carga_horaria |
-- +----+-------+---------------+
-- |  1 | MySQL |            28 |
-- |  2 | C#    |            40 |
-- +----+-------+---------------+

-- Consultar os cursos limitados a dois registros da segunda página
SELECT * FROM cursos LIMIT 2, 2;
-- +----+--------+---------------+
-- | id | nome   | carga_horaria |
-- +----+--------+---------------+
-- |  3 | Python |            39 |
-- |  4 | Java   |            41 |
-- +----+--------+---------------+

-- Consultar os cursos limitados a dois registros da terceira página
SELECT * FROM cursos LIMIT 4, 2;
-- +----+-----------+---------------+
-- | id | nome      | carga_horaria |
-- +----+-----------+---------------+
-- |  5 | HTML, CSS |            32 |
-- |  6 | React     |            52 |
-- +----+-----------+---------------+

SELECT 
    nome,
    CASE WHEN YEAR(data_nascimento) BETWEEN 1980 AND 1994 THEN "Geração Y"
        WHEN YEAR(data_nascimento) BETWEEN 1995 AND 2009 THEN "Geração Z"
        WHEN YEAR(data_nascimento) BETWEEN 2010 AND 2023 THEN "Geração Alpha"
        ELSE "Geração X"
    END AS "Geração" -- AS chamado ALIAS (Apelido)
    FROM alunos;

CREATE TABLE turmas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT NOT NULL, -- FK(id_curso) aponta tabela cursos para coluna id(PK)
    id_professor INT NOT NULL,-- FK(id_professor) aponta tabela professores para coluna id(PK)

    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,

    -- FOREIGN KEY(nome_da_coluna_de_fk) REFERENCES nome_tabela(primary_key)
    FOREIGN KEY(id_curso) REFERENCES cursos(id),
    FOREIGN KEY(id_professor) REFERENCES professores(id)
);



INSERT INTO turmas (id_curso, id_professor, data_inicio, data_termino) VALUES
(1,	1,	"2023-03-12",	"2023-04-16"),
(2,	1,	"2023-05-01",	"2023-07-10"),
(3,	2,	"2024-01-01",	"2024-02-10"),
(4,	2,	"2022-01-01",	"2022-12-31"),
(5,	3,	"2023-04-01",	"2023-04-10"),
(6,	4,	"2024-01-10",	"2024-02-10"),
(5,	5,	"2023-05-11",	"2023-05-20"),
(5,	3,	"2023-08-01",	"2023-08-20");

-- Consultar nome do professor e data de início
SELECT
    t.id, -- > ID da tabela de turmas, ou seja, o código da turma
    p.nome AS "Professor", -- > Nome do professor da tabela professores
    t.data_inicio
    FROM turmas AS t
    -- INNER JOIN nome_tabela AS apelido ON (PK = FK)
    INNER JOIN professores AS p ON (p.id = t.id_professor);

SELECT 
    cursos.nome AS "Curso",
    turmas.data_inicio AS "Data de inicio",
    turmas.data_termino AS "Data de término"
    FROM turmas
    INNER JOIN cursos ON(cursos.id = turmas.id_curso);

SELECT
    LOWER(professores.nome) AS "Professor", -- Nome do professor em caixa baixa
    UPPER(cursos.nome) AS "Curso", -- Nome do curso em caixa alta
    turmas.data_inicio AS "Data de inicio",
    turmas.data_termino AS "Data de término"
    FROM turmas
    INNER JOIN professores ON(professores.id = turmas.id_professor)
    INNER JOIN cursos ON (cursos.id = turmas.id_curso);

-- Nome do professor => Nome Curso (Carga horária)
SELECT
    CONCAT(
        professores.nome, SPACE(30 - LENGTH(professores.nome)), " => ",
        cursos.nome,SPACE(30 - LENGTH(cursos.nome)), " (",
        cursos.carga_horaria, ")"
    ) AS "Turmas"
    FROM professores
    INNER JOIN turmas ON (professores.id = turmas.id_professor)
    INNER JOIN cursos ON (cursos.id = turmas.id_curso);

SELECT CONCAT(SUBSTRING(nome, 1, 2), "...") FROM cursos;

CREATE TABLE mercadorias(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

INSERT INTO mercadorias(nome) VALUES
("   Nescau   "),
("Nescau"),
("Nescau  "),
("Nescau cereal"),
("O nescau de todo dia"),
("Nescal com L"),
("Uma mercadoria que termina com nescau");

-- Consultar as mercadorias onde o nome Nescau
SELECT * FROM mercadorias WHERE nome = "Nescau"; -- 2

-- Consultar as mercadorias onde nome termina com nescau
SELECT * FROM mercadorias WHERE nome LIKE "Nescau%"; -- 2,3,4

-- Consultar as mercadorias onde nome começa com nescau
SELECT * FROM mercadorias WHERE nome LIKE "%Nescau"; -- 2,7

-- Consultar as mercadorias que contém com nescau
SELECT * FROM mercadorias WHERE nome LIKE "%Nescau%"; -- 1,2,3,4,5,7

-- Consultar o nome das mercadorias substituindo o Nescal por Nescau
SELECT REPLACE(nome, "Nescal", "Nescau") FROM mercadorias;

-- Consultar o nome removendo os espaços da esquerda
SELECT LTRIM(nome), LENGTH(LTRIM(nome)) FROM mercadorias;

-- Consultar o nome removendo os espaços da esquerda
SELECT RTRIM(nome), LENGTH(RTRIM(nome)) FROM mercadorias;

-- Consultar o nome removendo os espaços da esquerda e direita
SELECT TRIM(nome), LENGTH(TRIM(nome)) FROM mercadorias;

-- Adicionar coluna de data de vencimento na tabela de mercadorias
ALTER TABLE mercadorias ADD COLUMN data_vencimento DATE;

-- Apagar coluna de data de vencimento da tabela de mercadorias;
ALTER TABLE mercadorias DROP COLUMN data_vencimento;

-- Consultar o comando de CREATE TABLE da tabela de mercadorias
SHOW CREATE TABLE mercadorias;

-- Adicionar coluna de
ALTER TABLE mercadorias ADD COLUMN data_vencimento DATE; -- Será adicionada depois da coluna nome
ALTER TABLE mercadorias ADD COLUMN estoque INT FIRST; -- Será a primeira coluna
-- Será adicionada entre a coluna nome e data_vencimento
ALTER TABLE mercadorias ADD COLUMN valor_unitario FLOAT(5,2) AFTER nome; 

-- Definir o valor padrão para a coluna data de vencimento do produto
ALTER TABLE mercadorias ALTER data_vencimento SET DEFAULT '2023-04-05'
-- TODO
-- ALTER TABLE mercadorias ALTER data_vencimento SET DEFAULT ;

UPDATE mercadorias SET data_vencimento = DATE_ADD(NOW(),INTERVAL 10 DAY);

INSERT INTO mercadorias(nome, estoque, valor_unitario) VALUE ('Toddy', 3, 13.5);

ALTER TABLE mercadorias ALTER data_vencimento DROP DEFAULT;

INSERT INTO mercadorias (nome, estoque, valor_unitario, data_vencimento) VALUE
('Todinho', 1,5.00, '2024-01-01');

-- Alterar o tamanho da coluna do nome de 30 carac para 75 carac
ALTER TABLE mercadorias MODIFY nome VARCHAR(75);

-- Renomear coluna valor_unitario para preco_unitario da tabela de mercadorias
ALTER TABLE mercadorias CHANGE valor_unitario preco_unitario FLOAT(5,2);

-- Renomear tabela de mercadorias para mercadorias_do_mercado
ALTER TABLE mercadorias RENAME TO mercadorias_do_mercado;

CREATE TABLE alunos_turmas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_turma INT NOT NULL,
    id_aluno INT NOT NULL,

    FOREIGN KEY(id_turma) REFERENCES turmas(id),
    FOREIGN KEY(id_aluno) REFERENCES alunos(id)

);

INSERT INTO alunos_turmas(id_turma, id_aluno) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 2),
(3, 1),
(3, 5),
(4, 4),
(7, 1),
(8, 1),
(6, 5),
(6, 4),
(6, 1);

SELECT 
    alunos.nome AS "Aluno",
    turmas.id AS "Código da Turma",
    cursos.nome AS "Curso"
    FROM alunos_turmas
    INNER JOIN turmas ON(turmas.id = alunos_turmas.id_turma)
    INNER JOIN cursos ON(cursos.id = turmas.id_curso)
    INNER JOIN alunos ON(alunos.id = alunos_turmas.id_aluno);

SELECT
    alunos.nome AS "Aluno",
    professores.nome AS "Professor"
    FROM alunos_turmas

    INNER JOIN alunos ON(alunos.id = alunos_turmas.id_aluno)
    INNER JOIN turmas ON(turmas.id = alunos_turmas.id_turma)
    INNER JOIN professores ON (professores.id = turmas.id_professor);

SELECT 
    alunos.nome AS "Aluno",
    cursos.nome AS "Curso",
    turmas.data_inicio AS "Data início",
    turmas.data_termino AS "Data término"
    FROM alunos_turmas

    INNER JOIN alunos ON(alunos.id = alunos_turmas.id_aluno)
    INNER JOIN turmas ON(turmas.id = alunos_turmas.id_turma)
    INNER JOIN cursos ON(cursos.id = turmas.id_curso)
    
    ORDER BY data_inicio ASC;
