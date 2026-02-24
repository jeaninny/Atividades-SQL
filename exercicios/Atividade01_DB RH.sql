-- Criar Banco de Dados
CREATE DATABASE db_RH;

-- Acessar/Selecionar o banco de Dados Atual
USE db_RH;

-- Criar Tabela
CREATE TABLE tb_colaboradores (
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
salario decimal (10, 2) NOT NULL,
cargo varchar(255) NOT NULL,
data_entrada date,
PRIMARY KEY (id)
);

-- Inserir dados na tabela
INSERT INTO tb_colaboradores (nome, salario, cargo, data_entrada)
VALUES	("Fernanda", 4500.00, "recepcionista", "2024-03-02"),
		("Antonio", 3000.00, "zelador", "2025-05-02"),
        ("Amanda", 7000.00, "analista", "2023-01-04"),
        ("Rodrigo", 2000.00, "trainee", "2026-02-01"),
        ("Patrícia", 13000.00, "gerente", "2021-06-12");
	
-- Visualizar todos os dados
SELECT * FROM tb_colaboradores;

-- Visualizar colaboradores com salário > 2k
SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

-- Visualizar colaboradores com salário < 2k
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

-- Atualização de registros da tabela
UPDATE tb_colaboradores SET salario = 1500.00 WHERE id = 2;
UPDATE tb_colaboradores SET salario = 1800.00 WHERE id = 4;
UPDATE tb_colaboradores SET cargo = "CEO" WHERE id = 5;
UPDATE tb_colaboradores SET salario = 25000.00 WHERE id = 5;

-- EXTRA 1: Visualizar salário formatado para Reais e data de entrada no padrão pt BR
SELECT nome,
	DATE_FORMAT(data_entrada, '%d/%m/%Y') AS Data_Entrada,
    CONCAT('R$ ', FORMAT (salario, 2, 'pt_BR')) AS Salario
FROM tb_colaboradores;
    
-- EXTRA 2: Adicionar um novo Atributo à Tabela
ALTER TABLE tb_colaboradores ADD email varchar(255);

-- EXTRA 3: Atualizar o atributo email na tabela
UPDATE tb_colaboradores SET email = "fernanda@gmail.com" WHERE id = 1;
UPDATE tb_colaboradores SET email = "antonio@gmail.com" WHERE id = 2;
UPDATE tb_colaboradores SET email = "amanda@outlook.com.br" WHERE id = 3;
UPDATE tb_colaboradores SET email = "rodrigo@msn.com" WHERE id = 4;
UPDATE tb_colaboradores SET email = "patricia@gmail.com" WHERE id = 5;
