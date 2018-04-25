CREATE TABLE empresa(
	id BIGINT(20) NOT NULL,
	cnpj VARCHAR(255) NOT NULL, 
	data_atualizacao DATETIME NOT NULL,
	data_criacao DATETIME NOT NULL, 
	razao_social VARCHAR(255) NOT NULL 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE FUNCIONARIO(
	ID BIGINT(20) NOT NULL,
	CPF VARCHAR(255) NOT NULL,
	DATA_ATUALIZACAO DATETIME NOT NULL,
	DATA_CRIACAO DATETIME NOT NULL, 
	EMAIL VARCHAR(255) NOT NULL, 
	NOME VARCHAR(255) NOT NULL, 
	PERFIL VARCHAR(255) NOT NULL, 
	QTD_HORAS_ALMOCO FLOAT DEFAULT NULL,
	QTD_HORAS_TRABALHO_DIA FLOAT DEFAULT NULL,
	SENHA VARCHAR(255) NOT NULL,
	VALOR_HORA DECIMAL(19,2) DEFAULT NULL,
	EMPRESA_ID BIGINT (20) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE LANCAMENTO(
	ID BIGINT(20) NOT NULL,
	DATA DATETIME NOT NULL,
	DATA_ATUALIZACAO DATETIME NOT NULL,
	DATA_CRIACAO DATETIME NOT NULL,
	DESCRICAO VARCHAR(255) DEFAULT NULL,
	LOCALIZACAO VARCHAR(255) DEFAULT NULL,
	TIPO VARCHAR(255) NOT NULL,
	FUNCIONARIO_ID BIGINT(20) DEFAULT NULL 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE EMPRESA
	ADD PRIMARY KEY (ID);
	
ALTER TABLE FUNCIONARIO
 ADD PRIMARY KEY (ID),
ADD KEY FK4cm1kg523jlopyexjbmi6y54j (EMPRESA_ID);

ALTER TABLE LANCAMENTO
	ADD PRIMARY KEY (ID),
	ADD KEY FK46i4K7VL8wah7feutye9kbpi4 (FUNCIONARIO_ID);
	
ALTER TABLE EMPRESA
		MODIFY ID BIGINT(20) NOT NULL AUTO_INCREMENT;
		
ALTER TABLE LANCAMENTO
	MODIFY ID BIGINT(20) NOT NULL AUTO_INCREMENT;
	
ALTER TABLE FUNCIONARIO
	ADD CONSTRAINT FK4cm1kg523jlopyexjbmi6y54j FOREIGN KEY (EMPRESA_ID) REFERENCES EMPRESA (ID);

ALTER TABLE LANCAMENTO
	ADD CONSTRAINT FK46i4K5VL8WAH7FEUTYE9KBPI4 FOREIGN KEY (FUNCIONARIO_ID) REFERENCES FUNCIONARIO (ID);
 