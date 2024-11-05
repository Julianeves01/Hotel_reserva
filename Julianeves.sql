CREATE DATABASE reserva_hotel;
\c reserva_hotel;

CREATE TABLE Hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    documento VARCHAR(50),
    telefone VARCHAR(20)
);

CREATE TABLE Quartos (
    id_quarto SERIAL PRIMARY KEY,
    numero_quarto INT UNIQUE NOT NULL,
    quarto_disponível BOOLEAN NOT NULL,
    preco_diaria DECIMAL(10,2)
);

CREATE TABLE Reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    data_inicio DATE NOT NULL DEFAULT CURRENT_DATE,
    data_fim DATE DEFAULT CURRENT_DATE,
    FOREING KEY (id_hospede) REFERENCES Hospedes (id_hospede),
    FOREING KEY (id_quarto) REFERENCES Quartos (id_quarto),
);