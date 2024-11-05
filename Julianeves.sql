CREATE DATABASE reservas_hotel;
\c reservas_hotel;

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
    FOREIGN KEY (id_hospede) REFERENCES Hospedes (id_hospede),
    FOREIGN KEY (id_quarto) REFERENCES Quartos (id_quarto)
);

INSERT INTO Hospedes (nome, idade, documento, telefone) VALUES
('Ana Julia', '19', '123456789', '+55 19 99257-4495'),
('Amanda Mechi', '19', '987654321', '+55 19 98938-1329'),
('Flavia Mendes', '24', '760924521', '+55 19 98264-2226'),
('Giovanna Caron', '30', '123456789', '+55 19 99257-4495'),
('Kevin Nino', '23', '241365870', '+55 19 99353-3151');

INSERT INTO Quartos (numero_quarto, quarto_disponível, preco_diaria) VALUES
(105, TRUE, 250.00),
(106, TRUE, 250.00),
(120, FALSE, 250.00),
(89, FALSE, 250.00),
(7, TRUE, 250.00);

INSERT INTO Reservas (id_hospede, id_quarto, data_entrada, data_saida) VALUES
(1, 1, '2025-04-26', '2025-04-30'),
(2, 2, '2024-12-24', '2024-12-27'),
(3, 3, '2024-12-25', '2024-12-29'),
(4, 4, '2025-10-01', '2025-10-05'),
(5, 5, '2025-02-17', '2025-02-24');

/*listar apenas os hóspedes que já finalizaram suas estadias.*/

SELECT 
       h.nome AS hospede,
       q.numero_quarto AS quarto,
       r.data_entrada,
       r.data_saida
FROM
       hospedes h
JOIN 
       reservas r ON h.id_hospede = r.id_hospede
JOIN
       quartos q ON r.id_quarto = q.id_quarto
WHERE
       r.data_saida BETWEEN '2024-12-25' AND '2024-12-29';

/* consulta para mostrar todos os hóspedes, incluindo aqueles que ainda estão com reservas ativas.*/
SELECT 
       h.nome AS hospede,
       q.numero_quarto AS quarto,
       r.data_entrada,
       r.data_saida
FROM
       hospedes h
JOIN 
       reservas r ON h.id_hospede = r.id_hospede
JOIN
       quartos q ON r.id_quarto = q.id_quarto;

/* consulta para mostrar apenas os quartos que ainda não foram reservados.*/
SELECT 
       q.numero_quarto AS quarto,
       q.quarto_disponível AS disponivel,
       q.preco_diaria
FROM
       quartos q
JOIN 
       reservas r ON q.id_quarto = r.id_quarto
WHERE
       r.id_reserva IS NULL;

       

