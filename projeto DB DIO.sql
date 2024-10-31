CREATE TABLE Cliente CPF (
  id_cliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NULL,
  identificacao VARCHAR(255) NULL,
  endereco VARCHAR(255) NULL,
  PRIMARY KEY(id_cliente)
);

CREATE TABLE Cliente PJ (
  idCliente PJ INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  razao social VARCHAR(255) NULL,
  cnpj VARCHAR(45) NULL,
  telefone VARCHAR(20) NULL,
  PRIMARY KEY(idCliente PJ)
);

CREATE TABLE Entregas (
  idEntregas INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  status_2 VARCHAR(255) NULL,
  rastreio VARCHAR(255) NULL,
  PRIMARY KEY(idEntregas)
);

CREATE TABLE Estoque (
  idEstoque INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  produto VARCHAR(255) NULL,
  catergoria VARCHAR(255) NULL,
  quantidade INTEGER UNSIGNED NULL,
  PRIMARY KEY(idEstoque)
);

CREATE TABLE Fornecedor (
  idFornecedor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  rasao_social VARCHAR(255) NULL,
  cnpj VARCHAR(45) NULL,
  PRIMARY KEY(idFornecedor)
);

CREATE TABLE Pagamento (
  idPagamento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Cliente PJ_idCliente PJ INTEGER UNSIGNED NOT NULL,
  Cliente CPF_id_cliente INTEGER UNSIGNED NOT NULL,
  Cartao credito VARCHAR(45) NULL,
  Boleto VARCHAR(45) NULL,
  Pix VARCHAR(255) NULL,
  PRIMARY KEY(idPagamento),
  INDEX Pagamento_FKIndex1(Cliente CPF_id_cliente),
  INDEX Pagamento_FKIndex2(Cliente PJ_idCliente PJ)
);

CREATE TABLE Pedido (
  idpedido INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Cliente PJ_idCliente PJ INTEGER UNSIGNED NOT NULL,
  Cliente CPF_id_cliente INTEGER UNSIGNED NOT NULL,
  status_2 VARCHAR(255) NULL,
  descrição VARCHAR(255) NULL,
  PRIMARY KEY(idpedido),
  INDEX Pedido_FKIndex1(Cliente CPF_id_cliente),
  INDEX Pedido_FKIndex2(Cliente PJ_idCliente PJ)
);

CREATE TABLE Produto (
  idproduto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Entregas_idEntregas INTEGER UNSIGNED NOT NULL,
  Fornecedor_idFornecedor INTEGER UNSIGNED NOT NULL,
  categoria VARCHAR(255) NULL,
  descricao VARCHAR(255) NULL,
  valor VARCHAR(45) NULL,
  PRIMARY KEY(idproduto),
  INDEX Produto_FKIndex1(Fornecedor_idFornecedor),
  INDEX Produto_FKIndex2(Entregas_idEntregas)
);

CREATE TABLE Relacao Vendedor tipo Produto (
  Vendedor_idVendedor INTEGER UNSIGNED NOT NULL,
  Produto_idproduto INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Vendedor_idVendedor, Produto_idproduto),
  INDEX Vendedor_has_Produto_FKIndex1(Vendedor_idVendedor),
  INDEX Vendedor_has_Produto_FKIndex2(Produto_idproduto)
);

CREATE TABLE relação dePedido por Produto (
  Pedido_idpedido INTEGER UNSIGNED NOT NULL,
  Produto_idproduto INTEGER UNSIGNED NOT NULL,
  quantidade INTEGER UNSIGNED NULL,
  PRIMARY KEY(Pedido_idpedido, Produto_idproduto),
  INDEX Pedido_has_Produto_FKIndex1(Pedido_idpedido),
  INDEX Pedido_has_Produto_FKIndex2(Produto_idproduto)
);

CREATE TABLE Vendedor (
  idVendedor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  razao_social VARCHAR(255) NULL,
  local_2 VARCHAR(255) NULL,
  telefone VARCHAR(45) NULL,
  PRIMARY KEY(idVendedor)
);


