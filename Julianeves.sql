CREATE DATABASE reserva_hotel;
\c reserva_hotel;

CREATE TABLE Hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    idade INT NOT NULL,
    documento VARCHAR(50),
    telefone VARCHAR(20)
);

CREATE TABLE Quartos (
    id_quarto SERIAL PRIMARY KEY,
    numero_quarto INT UNIQUE NOT NULL,
    quarto_disponível BOOLEAN DEFAULT TRUE,
    preco_diaria DECIMAL(10,2)
);

CREATE TABLE Reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    data_entrada DATE NOT NULL DEFAULT CURRENT_DATE,
    data_saida DATE DEFAULT CURRENT_DATE,
    FOREING KEY (id_hospede) REFERENCES Hospedes (id_hospede),
    FOREING KEY (id_quarto) REFERENCES Quartos (id_quarto)
);

INSERT INTO Hospedes (nome, idade, documento, telefone) VALUES
('Ana Julia Dematei', '19', '123456789' '+55 19 99257- 4495'),
('Amanda Mechi', '19', '987654321' '+55 19 98938 - 1329'),
('Flavia Mendes', '24' '760924521' '+55 19 98264-2226'),
('Giovanna Caron', '30', '123456789' '+55 19 99257- 4495'),
('Kevin Nino', '23', '241365870' '+55 19 99353-3151');

INSERT INTO Quartos (numero_quarto, quarto_disponível, preco_diaria) VALUES
(235, TRUE, 250.00),
(106, TRUE, 250.00),
(120, FALSE, 250.00),
(89, FALSE, 250.00),
(07, TRUE, 250.00);

INSERT INTO Reservas (id_reserva, id_hospede, id_quarto, data_entrada, data_saida) VALUES
(1, 1, 235, '2025-04-26', '2025-04-30'),
(2, 2, 106, '2024-12-24', '2024-12-27'),
(3, 3, 120, '2024-12-25', '2024-12-29'),
(4, 4, 89, '2025-10-01, '2025-10-05'),
(5, 5, 07, '2025-02-17, '2025-02-24')
);



