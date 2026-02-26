-- Criar o Banco de Dados db_generation_game_online
CREATE DATABASE db_generation_game_online;

-- Selecionar o Banco de Dados db_generation_game_online
USE db_generation_game_online;

-- Criar a tabela tb_classes
CREATE TABLE tb_classes (
id bigInt AUTO_INCREMENT,
nome varchar(255) NOT NULL,
descricao varchar(255),
arma_principal varchar(255),
tipo_ataque varchar(255),
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_classes
INSERT INTO tb_classes (nome, descricao, arma_principal, tipo_ataque)
VALUES	("Arqueiro", "Especialista em combate a longa distancia", "Arco", "Distancia"),
		("Guerreiro", "Combatente forte e resistente", "Espada", "Fisico"),
		("Mago", "Usuario de magia ofensiva", "Cajado", "Magico"),
		("Assassino", "Ataques furtivos e criticos", "Adagas", "Fisico"),
		("Paladino", "Guerreiro sagrado com equilibrio entre ataque e defesa", "Martelo", "Hibrido");

-- Visualiza todos os dados da tabela tb_classes
SELECT * FROM tb_classes;

-- Criar a tabela tb_personagens
CREATE TABLE tb_personagens (
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
descricao varchar(255),
nivel int,
nivel_ataque int,
classe_id bigint,
PRIMARY KEY (id),
FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- Insere dados na tabela tb_personagens
INSERT INTO tb_personagens (nome, descricao, nivel, nivel_ataque, classe_id)
VALUES	("Legolas", "Arqueiro elfico preciso", 10, 1850, 1),
		("Robin", "Caçador estrategico", 7, 1200, 1),
        ("Kael", "Aprendiz de arqueiro", 4, 750, 1),
        
        ("Thorin", "Guerreiro anao resistente", 12, 2300, 2),
        ("Maximus", "Soldado experiente", 8, 1600, 2),
        ("Draven", "Mercenario brutal", 6, 1400, 2),
        
        ("Merlin", "Mago ancestral poderoso", 15, 3200, 3),
        ("Zyra", "Feiticeira elemental", 9, 2100, 3),
        
        ("Shade", "Assassino das sombras", 11, 2600, 4),
        ("Nyx", "Especialista em furtividade", 6, 1100, 4),
        
        ("Aldric", "Paladino defensor do reino", 13, 2400, 5),
        ("Helena", "Guardia sagrada", 10, 1700, 5),
        ("Lucian", "Paladino iniciante", 5, 900, 5);

-- Visualiza todos os dados da tabela tb_personagens
SELECT * FROM tb_personagens;

-- SELECT que retorna todos os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE nivel_ataque > 2000;

-- SELECT que retorna todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE nivel_ataque BETWEEN 1000 AND 2000;

-- SELECT com operador LIKE, que busca todos o personagens que possuam a letra C no atributo nome
SELECT * FROM tb_personagens WHERE nome LIKE "%c%";
SELECT * FROM tb_personagens WHERE nome LIKE "%c";

-- SELECT com INNER JOIN
SELECT tb_personagens.nome AS personagens_nome,
tb_personagens.descricao AS descricao_personagem,
tb_classes.nome AS nome_classe,
tb_classes.descricao AS descricao_classe
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id;

-- SELECT com INNER JOIN e apenas os personagens que pertençam a uma classe específica
SELECT tb_personagens.nome AS personagens_nome,
tb_personagens.descricao AS descricao_personagem,
tb_classes.nome AS nome_classe,
tb_classes.descricao AS descricao_classe
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.nome = "Arqueiro";

-- EXTRA 1: ORDER BY + Ordenação pelos personagens mais fortes
SELECT nome, nivel_ataque FROM tb_personagens ORDER BY nivel_ataque DESC;

-- EXTRA 2 - INNER JOIN + GROUP BY + poder medio por classe
SELECT tb_classes.nome AS nome_classe,
AVG(tb_personagens.nivel_ataque) AS media_ataque
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
GROUP BY tb_classes.nome;
