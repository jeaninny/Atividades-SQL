-- Criar Banco de Dados
CREATE DATABASE db_escola;

-- Acessar/Selecionar o Banco de Dados Atual
USE db_escola;

-- Criar Tabela
CREATE TABLE tb_estudantes (
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
genero varchar(20),
data_nascimento date NOT NULL,
ano_escolar int,
media_final decimal (3,1),
PRIMARY KEY(id)
);

-- Inserir dados na tabela
INSERT INTO tb_estudantes (nome, genero, data_nascimento, ano_escolar, media_final)
VALUES	("Maria de Lourdes", "Feminino", "2018-03-15", 2, 8.5),
	("Enzo Costa", "Masculino", "2017-07-22", 2, 7.8),
	("Nathália Coutinho", "Feminino", "2016-11-05", 3, 10.0),
	("Fernando Abreu", "Masculino", "2015-01-30", 4, 6.9),
	("Luana Cunha", "Feminino", "2014-09-12", 5, 8.0),
	("Beatriz Santos", "Feminino", "2013-04-18", 6, 7.5),
	("Samara Costa", "Feminino", "2012-12-03", 7, 9.3),
	("Felipe Medeiros", "Masculino", "2011-06-27", 8, 6.7);

-- Visualizar todos os dados
SELECT * FROM tb_estudantes;

-- Visualizar estudantes com nota > 7.0
SELECT * FROM tb_estudantes WHERE media_final > 7.0;

-- Visualizar estudantes com nota < 7.0
SELECT * FROM tb_estudantes WHERE media_final < 7.0;

-- EXTRA 1: Visualizar data_nascimento formatada no padrão pt_BR
SELECT nome, DATE_FORMAT(data_nascimento, '%d/%m/%Y') AS Data_Nascimento FROM tb_estudantes;

-- EXTRA 2: Adicionar Atributos de nome_responsável e contato_emergencia à tabela
ALTER TABLE tb_estudantes
	ADD nome_responsavel varchar(255),
    ADD contato_emergencia varchar(25); 

-- EXTRA 3: Update de nome_responsável e contato_emergencia
UPDATE tb_estudantes
SET nome_responsavel = CASE id
	WHEN 1 THEN "Carlos"
	WHEN 2 THEN "Romeu"
	WHEN 3 THEN "Carla"
	WHEN 4 THEN "Fernanda"
	WHEN 5 THEN "Cínthia"
	WHEN 6 THEN "Zoraia"
	WHEN 7 THEN "Elcio"
	WHEN 8 THEN "Janaina"
END,
contato_emergencia = CASE id
	WHEN 1 THEN "(21) 99874-3210"
	WHEN 2 THEN "(21) 98765-1122"
	WHEN 3 THEN "(21) 99654-7788"
	WHEN 4 THEN "(21) 98823-4455"
	WHEN 5 THEN "(21) 99711-6633"
	WHEN 6 THEN "(21) 98990-2244"
	WHEN 7 THEN "(21) 99812-3344"
	WHEN 8 THEN "(21) 99677-8899"
END
WHERE id IN (1,2,3,4,5,6,7,8);