CREATE TABLE HOTEL ( 
    ID_HOTEL INT PRIMARY KEY auto_increment not null, 
    NOME VARCHAR(50) NOT NULL, 
    TELEFONE VARCHAR(50), 
    RUA VARCHAR(100), 
    NUMERO INT 
); 
CREATE TABLE QUARTO ( 
    ID_QUARTO INT PRIMARY KEY auto_increment not null, 
    NUMERO INT NOT NULL, 
    STATUS BOOLEAN NOT NULL, 
    FK_HOTEL_ID_HOTEL INT, 
    FK_TIPOS_ID_TIPO INT 
); 
CREATE TABLE HOSPEDE ( 
    ID_HOSPEDE INT PRIMARY KEY auto_increment not null, 
    NOME VARCHAR(50), 
    TELEFONE VARCHAR(50), 
    EMAIL VARCHAR(100), 
    DATA_NASCIMENTO DATE, 
    CPF VARCHAR(11) NOT NULL UNIQUE 
); 
CREATE TABLE FUNCIONARIO ( 
    ID_FUNCIONARIO INT PRIMARY KEY auto_increment not null, 
    NOME VARCHAR(100) NOT NULL, 
    TELEFONE VARCHAR(50), 
    ADMISSAO DATE, 
    CARGO VARCHAR(50) NOT NULL, 
    FK_HOTEL_ID_HOTEL INT 
); 
CREATE TABLE RESERVA ( 
    ID_RESERVA INT PRIMARY KEY auto_increment not null, 
    CHECKIN DATE NOT NULL, 
    CHECKOUT DATE NOT NULL, 
    NUM_HOSPEDES INT, 
    FK_QUARTO_ID_QUARTO INT, 
    FK_HOSPEDE_ID_HOSPEDE INT 
); 
CREATE TABLE TIPOS ( 
    ID_TIPO INT PRIMARY KEY auto_increment not null, 
    PRECO FLOAT NOT NULL, 
    TIPO VARCHAR(50) NOT NULL, 
    DESCRICAO TEXT 
); 
  
ALTER TABLE QUARTO ADD CONSTRAINT FK_QUARTO_2 
    FOREIGN KEY (FK_HOTEL_ID_HOTEL) 
    REFERENCES HOTEL (ID_HOTEL) 
    ON DELETE RESTRICT; 
  
ALTER TABLE QUARTO ADD CONSTRAINT FK_QUARTO_3 
    FOREIGN KEY (FK_TIPOS_ID_TIPO) 
    REFERENCES TIPOS (ID_TIPO) 
    ON DELETE RESTRICT; 
  
ALTER TABLE FUNCIONARIO ADD CONSTRAINT FK_FUNCIONARIO_2 
    FOREIGN KEY (FK_HOTEL_ID_HOTEL) 
    REFERENCES HOTEL (ID_HOTEL) 
    ON DELETE RESTRICT; 
  
ALTER TABLE RESERVA ADD CONSTRAINT FK_RESERVA_2 
    FOREIGN KEY (FK_QUARTO_ID_QUARTO) 
    REFERENCES QUARTO (ID_QUARTO) 
    ON DELETE CASCADE; 
  
ALTER TABLE RESERVA ADD CONSTRAINT FK_RESERVA_3 
    FOREIGN KEY (FK_HOSPEDE_ID_HOSPEDE) 
    REFERENCES HOSPEDE (ID_HOSPEDE) 
    ON DELETE RESTRICT; 



