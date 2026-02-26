-- Criar o Banco de Dados db_pizzaria_legal
CREATE DATABASE db_pizzaria_legal;

-- Selecionar o Banco de Dados db_pizzaria_legal
USE db_pizzaria_legal;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias (
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
descricao varchar(255),
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao)
VALUES	("Tradicional", "Pizzas com sabores classicos e populares da pizzaria"),		
        ("Especial", "Pizzas com combinacoes diferenciadas ou ingredientes gourmet"),
        ("Vegetariana", "Pizzas preparadas sem qualquer tipo de carne"),
        ("Vegana", "Pizzas preparadas sem qualquer ingrediente de origem animal, incluindo queijos e derivados"),
        ("Doce", "Pizzas com ingredientes doces, normalmente servidas como sobremesa");        
        
-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a tabela tb_pizzas
CREATE TABLE tb_pizzas (
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
descricao varchar(255),
tamanho ENUM ('P', 'M', 'G') NOT NULL,
preco decimal (6,2) NOT NULL,
categoria_id bigint,
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_pizzas
INSERT INTO tb_pizzas (nome, descricao, tamanho, preco, categoria_id)
VALUES	("Calabresa", "Molho de tomate, mussarela e calabresa fatiada", "G", 49.90, 1),
		("Portuguesa", "Molho de tomate, mussarela, presunto, ovo e cebola", "M", 52.00, 1),
		("Rucula com Parma e Burrata", "Mussarela, presunto parma, burrata e rucula fresca", "G", 72.00, 2),
		("Brie com Damasco", "Queijo brie, damasco e toque de mel", "M", 75.50, 2),
		("Quatro Queijos", "Mussarela, provolone, parmesao e gorgonzola", "G", 59.90, 3),
		("Brocolis com Catupiry", "Brocolis temperado com catupiry cremoso", "M", 56.00, 3),
		("Abobrinha", "Molho de tomate, abobrinha grelhada e tofu temperado", "M", 58.50, 4),
		("Chocolate com Morango", "Chocolate ao leite com morangos frescos", "P", 39.90, 5);
        
-- Visualiza todos os dados da tabela tb_pizzas
SELECT * FROM tb_pizzas;

-- Tornando categoria_id como NOT NULL
SELECT * FROM tb_pizzas WHERE categoria_id IS NULL;
ALTER TABLE tb_pizzas MODIFY categoria_id bigint NOT NULL;

-- Consultas
-- SELECT que retorna todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- SELECT que retorna todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- SELECT com operador LIKE, que busca todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas WHERE nome LIKE "%M%";
SELECT * FROM tb_pizzas WHERE nome LIKE "M%";
SELECT * FROM tb_pizzas WHERE nome LIKE "%M";

-- SELECT com INNER JOIN
SELECT tb_pizzas.nome AS nome_pizza,
tb_categorias.nome AS nome_categoria,
tb_pizzas.descricao AS descricao_da_pizza,
preco 
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id;

-- SELECT com INNER JOIN e apenas as pizzas que pertençam a uma categoria específica
SELECT tb_pizzas.nome AS nome_pizza,
tb_categorias.nome AS nome_categoria,
tb_pizzas.descricao AS descricao_da_pizza
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = "Tradicional";

-- Adicionando mais pizzas para enriquecer o cardápio de tb_pizzas
INSERT INTO tb_pizzas (nome, descricao, tamanho, preco, categoria_id)
VALUES	("Frango com Catupiry", "Molho de tomate, frango desfiado e catupiry cremoso", "G", 54.90, 1),
		("Filet Mignon com Cheddar", "Molho especial, filet mignon e cheddar cremoso", "G", 82.00, 2),
		("Palmito com Mussarela", "Molho de tomate, palmito e mussarela", "M", 57.00, 3),
		("Berinjela", "Molho de tomate, berinjela grelhada e tomate seco", "M", 60.00, 4),
		("Banana com Canela", "Banana caramelizada com canela e leite condensado", "P", 37.50, 5);

-- EXTRA 1: Filtragem com INNER JOIN e Group By + Having após verificação de média de preço
SELECT tb_categorias.nome AS nome_categoria,
avg(preco) as preco_medio
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
GROUP BY tb_categorias.nome
HAVING preco_medio > 50.00;

-- EXTRA 2: Inner Join com uma condição e ordenação de dados
SELECT	tb_categorias.nome AS nome_categoria,
		tb_pizzas.nome AS nome_pizza,
		tb_pizzas.descricao AS descricao_da_pizza       
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_pizzas.tamanho = "M"
ORDER BY descricao_da_pizza;