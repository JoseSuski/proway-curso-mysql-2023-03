
CREATE TABLE estoques(
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(50) NOT NULL,
    quatidade INT,
    preco_unitario FLOAT(6,2),
    data_vencimento DATE,
    categoria VARCHAR(30)
);

INSERT INTO estoques(produto, quatidade, preco_unitario, data_vencimento, categoria) VALUE("Maçã", 10, 0.50, "2023-03-25", "Fruta");
INSERT INTO estoques(produto, quatidade, preco_unitario, data_vencimento, categoria) VALUE("Pera", 24, 0.30, "2023-03-22", "Fruta");
INSERT INTO estoques(produto, quatidade, preco_unitario, data_vencimento, categoria) VALUE("Desinfetante", 4, 15.99, "2028-01-22", "Produto de limpeza");
INSERT INTO estoques(produto, quatidade, preco_unitario, data_vencimento, categoria) VALUE("Hamburguer", 12, 27.99, "2023-03-22", "Lanches");
INSERT INTO estoques(produto, quatidade, preco_unitario, data_vencimento, categoria) VALUE("Coxinha", 5, 6.99, "2023-03-22", "Lanches");
INSERT INTO estoques(produto, quatidade, preco_unitario, data_vencimento, categoria) VALUE("Refrigerante", 196, 7.49, "2023-03-22", "Bebidas");
INSERT INTO estoques(produto, quatidade, preco_unitario, data_vencimento, categoria) VALUE("Suco", 1024, 4.79, "2023-03-22", "Bebidas");

SELECT id, produto, quatidade, preco_unitario, data_vencimento, categoria FROM estoques;

SELECT MIN(preco_unitario) FROM estoques;

SELECT MAX(quatidade) FROM estoques;

SELECT SUM(preco_unitario*quatidade) FROM estoques;

SELECT categoria FROM estoques WHERE categoria = "Bebidas" AND ORDER BY quatidade ASC;