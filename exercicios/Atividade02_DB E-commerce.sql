-- Criar Banco de Dados
CREATE DATABASE db_ecommerce;

-- Acessar/Selecionar o Banco de Dados Atual
USE db_ecommerce;

-- Criar Tabela
CREATE TABLE tb_produtos (
id_produto bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int,
preco decimal(10,2) NOT NULL,
categoria varchar(255),
marca varchar(255),
PRIMARY KEY (id_produto)
);

-- Inserir dados na tabela
INSERT INTO tb_produtos (nome, quantidade, preco, categoria, marca)
VALUES	("Camiseta Dry Fit", 50, 129.90, "Camisetas", "Nike"),
		("Tênis Esportivo", 30, 700.00, "Calçados", "Adidas"),
		("Legging Compressão", 40, 189.90, "Calças", "Puma"),
		("Jaqueta Corta Vento", 20, 550.99, "Jaquetas", "Nike"),
		("Shorts Básico", 60, 99.90, "Shorts", "Under Armour"),
		("Moletom", 25, 600.00, "Moletom", "Adidas"),
		("Tênis Casual", 35, 650.90, "Calçados", "Puma"),
		("Top Esportivo", 45, 119.90, "Tops", "Nike");
        
-- Visualizar todos os dados
SELECT * FROM tb_produtos;

-- Visualizar produtos com valor > R$ 500.00
SELECT * FROM tb_produtos WHERE preco > 500.00;

-- Visualizar produtos com valor < R$ 500.00
SELECT * FROM tb_produtos WHERE preco < 500.00;

-- Atualização de registros da tabela
UPDATE tb_produtos SET quantidade = 20 WHERE id_produto IN (1, 3, 5);
UPDATE tb_produtos SET preco = 150.00 WHERE id_produto = 8;

-- EXTRA 1: Visualizar preco formatado para Reais
SELECT nome,
    CONCAT('R$ ', FORMAT (preco, 2, 'pt_BR')) AS Preco
FROM tb_produtos;

-- EXTRA 2: Adicionar um novo Atributo à Tabela
ALTER TABLE tb_produtos ADD avaliacao decimal(2,1);

-- EXTRA 3: Atualizar o atributo avaliacao na tabela
UPDATE tb_produtos
SET avaliacao = CASE id_produto
    WHEN 1 THEN 4.5
    WHEN 2 THEN 3.5
    WHEN 3 THEN 4.0
    WHEN 4 THEN 4.9
    WHEN 5 THEN 3.0
    WHEN 6 THEN 4.0
    WHEN 7 THEN 4.5
    WHEN 8 THEN 4.3
END
WHERE id_produto IN (1,2,3,4,5,6,7,8);

-- EXTRA 4: Atualizar valores da coluna Avaliacao
UPDATE tb_produtos SET avaliacao = 2.5 WHERE id_produto IN (2, 5);

-- EXTRA 5: Visualizar produtos com avaliação >= 3
SELECT * FROM tb_produtos WHERE avaliacao >= 3;

-- EXTRA 6: Visualizar produtos com avaliação <= 3
SELECT * FROM tb_produtos WHERE avaliacao <= 3;