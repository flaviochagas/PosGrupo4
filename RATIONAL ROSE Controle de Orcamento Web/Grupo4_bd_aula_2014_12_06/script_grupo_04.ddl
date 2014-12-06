CREATE TABLE T_Vendedor (
	codigo INTEGER NOT NULL,
	nome VARCHAR ( 255 ) NOT NULL,
	cpf VARCHAR ( 255 ) NOT NULL,
	ddd_fone VARCHAR ( 255 ) NOT NULL,
	fone VARCHAR ( 255 ) NOT NULL,
	cep VARCHAR ( 255 ) NOT NULL,
	cidade_nome VARCHAR ( 255 ) NOT NULL,
	estado_nome VARCHAR ( 255 ) NOT NULL,
	endereco VARCHAR ( 255 ) NOT NULL,
	endereco_num VARCHAR ( 255 ) NOT NULL,
	bairro VARCHAR ( 255 ) NOT NULL,
	complemento VARCHAR ( 255 ) NOT NULL,
	tipo CHARACTER ( 1 ) NOT NULL,
	T_Usuario_ID INTEGER NOT NULL,
	T_Orcamento_ID INTEGER NOT NULL,
	CONSTRAINT TC_T_Vendedor4 UNIQUE (T_Usuario_ID),
	CONSTRAINT PK_T_Vendedor7 PRIMARY KEY (T_Orcamento_ID)
	);
CREATE INDEX TC_T_Vendedor10 ON T_Vendedor (T_Usuario_ID )PCTFREE 0;
CREATE INDEX TC_T_Vendedor9 ON T_Vendedor (T_Orcamento_ID )PCTFREE 0;
CREATE TABLE T_Convenio (
	codigo SMALLINT NOT NULL,
	descricao VARCHAR ( 255 ) NOT NULL,
	desconto VARCHAR ( 255 ) NOT NULL,
	dt_cadastro SMALLINT NOT NULL,
	dt_validade SMALLINT NOT NULL,
	T_Convenio_ID INTEGER NOT NULL,
	CONSTRAINT PK_T_Convenio1 PRIMARY KEY (T_Convenio_ID)
	);
CREATE TABLE T_Produto (
	codigo INTEGER NOT NULL,
	nome VARCHAR ( 255 ) NOT NULL,
	codigoBarras VARCHAR ( 255 ) NOT NULL,
	precoCusto SMALLINT NOT NULL,
	precoVenda SMALLINT NOT NULL,
	status SMALLINT DEFAULT 0 NOT NULL,
	T_Produto_ID INTEGER NOT NULL,
	T_Grupo_ID INTEGER NOT NULL,
	T_Marca_ID INTEGER NOT NULL,
	CONSTRAINT PK_T_Produto5 PRIMARY KEY (T_Produto_ID)
	);
CREATE INDEX TC_T_Produto11 ON T_Produto (T_Grupo_ID )PCTFREE 0;
CREATE INDEX TC_T_Produto15 ON T_Produto (T_Marca_ID )PCTFREE 0;
CREATE TABLE T_Marca (
	codigo INTEGER NOT NULL,
	descricao SMALLINT NOT NULL,
	T_Marca_ID INTEGER NOT NULL,
	CONSTRAINT PK_T_Marca8 PRIMARY KEY (T_Marca_ID)
	);
CREATE TABLE T_Orcamento (
	codigo INTEGER NOT NULL,
	dt_orcamento SMALLINT NOT NULL,
	dt_validade SMALLINT NOT NULL,
	desconto SMALLINT NOT NULL,
	situacao_orcamento VARCHAR ( 255 ) NOT NULL,
	T_Orcamento_ID INTEGER NOT NULL,
	T_Cliente_ID INTEGER NOT NULL,
	T_Usuario_ID INTEGER NOT NULL,
	CONSTRAINT PK_T_Orcamento6 PRIMARY KEY (T_Orcamento_ID)
	);
CREATE INDEX TC_T_Orcamento12 ON T_Orcamento (T_Usuario_ID )PCTFREE 0;
CREATE INDEX TC_T_Orcamento13 ON T_Orcamento (T_Cliente_ID )PCTFREE 0;
CREATE TABLE T_Cliente (
	codigo SMALLINT NOT NULL,
	nome VARCHAR ( 255 ) NOT NULL,
	tipoPessoa_FJ SMALLINT NOT NULL,
	cnpj_cpf VARCHAR ( 255 ) NOT NULL,
	ddd_fone VARCHAR ( 255 ) NOT NULL,
	fone VARCHAR ( 255 ) NOT NULL,
	cep VARCHAR ( 255 ) NOT NULL,
	cidade_nome VARCHAR ( 255 ) NOT NULL,
	estado_nome VARCHAR ( 255 ) NOT NULL,
	endereco VARCHAR ( 255 ) NOT NULL,
	endereco_num VARCHAR ( 255 ) NOT NULL,
	bairro VARCHAR ( 255 ) NOT NULL,
	complemento VARCHAR ( 255 ) NOT NULL,
	email VARCHAR ( 255 ) NOT NULL,
	T_Cliente_ID INTEGER NOT NULL,
	T_Convenio_ID INTEGER,
	CONSTRAINT PK_T_Cliente0 PRIMARY KEY (T_Cliente_ID)
	);
CREATE INDEX TC_T_Cliente8 ON T_Cliente (T_Convenio_ID )PCTFREE 0;
CREATE TABLE T_Grupo (
	codigo INTEGER NOT NULL,
	descricao VARCHAR ( 255 ) NOT NULL,
	T_Grupo_ID INTEGER NOT NULL,
	CONSTRAINT PK_T_Grupo2 PRIMARY KEY (T_Grupo_ID)
	);
CREATE TABLE T_Usuario (
	codigo SMALLINT NOT NULL,
	nome VARCHAR ( 255 ) NOT NULL,
	email VARCHAR ( 255 ) NOT NULL,
	status SMALLINT DEFAULT 0 NOT NULL,
	senha VARCHAR ( 255 ) NOT NULL,
	permCadUsuario SMALLINT NOT NULL,
	permCadProduto SMALLINT NOT NULL,
	permCadVendedor SMALLINT NOT NULL,
	permCadConvenio SMALLINT NOT NULL,
	permCadCliente SMALLINT NOT NULL,
	permEmitirOrcamento SMALLINT NOT NULL,
	permEmitirRelat SMALLINT NOT NULL,
	T_Usuario_ID INTEGER NOT NULL,
	CONSTRAINT PK_T_Usuario3 PRIMARY KEY (T_Usuario_ID)
	);
ALTER TABLE T_Orcamento ADD CONSTRAINT FK_T_Orcamento5 FOREIGN KEY (T_Usuario_ID) REFERENCES T_Vendedor (T_Usuario_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE T_Orcamento ADD CONSTRAINT FK_T_Orcamento1 FOREIGN KEY (T_Cliente_ID) REFERENCES T_Cliente (T_Cliente_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE T_Produto ADD CONSTRAINT FK_T_Produto7 FOREIGN KEY (T_Marca_ID) REFERENCES T_Marca (T_Marca_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE T_Produto ADD CONSTRAINT FK_T_Produto2 FOREIGN KEY (T_Grupo_ID) REFERENCES T_Grupo (T_Grupo_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE T_Vendedor ADD CONSTRAINT FK_T_Vendedor6 FOREIGN KEY (T_Orcamento_ID) REFERENCES T_Orcamento (T_Orcamento_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE T_Vendedor ADD CONSTRAINT FK_T_Vendedor3 FOREIGN KEY (T_Usuario_ID) REFERENCES T_Usuario (T_Usuario_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE T_Cliente ADD CONSTRAINT FK_T_Cliente0 FOREIGN KEY (T_Convenio_ID) REFERENCES T_Convenio (T_Convenio_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMENT ON COLUMN T_Vendedor.tipo IS 'Identifica se o vendedor V = vendedor ou S = Supervisor';

