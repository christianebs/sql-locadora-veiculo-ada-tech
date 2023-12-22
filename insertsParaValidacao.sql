-- Inserindo Categorias
INSERT INTO Categoria (Nome) VALUES
('Compacto'),
('Sedan'),
('SUV'),
('Esportivo'),
('Utilitário');

-- Inserindo Carros
INSERT INTO Carro (Modelo, Montadora, Cor, Versao, StatusLocacaoCarro, QuilometragemAtual, CategoriaId) VALUES
('Golf', 'Volkswagen', 'Branco', '1.6 TSI', 'Disponivel', 5000, 1),
('Corolla', 'Toyota', 'Preto', 'XLI', 'Disponivel', 8000, 2),
('HR-V', 'Honda', 'Prata', 'EX', 'Alugado', 6000, 3),
('Mustang', 'Ford', 'Preto', 'GT', 'Disponivel', 3000, 4),
('Ranger', 'Ford', 'Branco', 'XLS', 'Alugado', 7000, 5);

-- Inserindo Clientes
INSERT INTO Cliente (Nome, Email, Cpf, Cnh, Telefone, Rua, Numero, Complemento, Bairro, Cidade, Estado, StatusLocacaoCliente) VALUES
('João da Silva', 'joao@email.com', '12345678901', '123456', '1234-5678', 'Rua A', 123, 'Apto 456', 'Bairro A', 'São Paulo', 'SP', 'Sem Carro Alugado'),
('Maria Santos', 'maria@email.com', '98765432109', '987654', '9876-5432', 'Rua B', 456, 'Apto 789', 'Bairro B', 'Santos', 'SP', 'Sem Carro Alugado'),
('Pedro Oliveira', 'pedro@email.com', '45678912307', '456789', '4567-8910', 'Rua C', 789, 'Casa 123', 'Bairro C', 'Rio de Janeiro', 'RJ', 'Com Carro Alugado'),
('Ana Pereira', 'ana@email.com', '65432198703', '654321', '6543-2198', 'Rua D', 987, 'Apto 321', 'Bairro D', 'Guarulhos', 'SP', 'Com Carro Alugado'),
('Lucas Fernandes', 'lucas@email.com', '78901234506', '789012', '7890-1234', 'Rua E', 234, 'Casa 567', 'Bairro E', 'Cabo Frio', 'RJ', 'Sem Carro Alugado');

-- Inserindo Franquias
INSERT INTO Franquia (Nome, Cidade, Estado) VALUES
('Franquia A', 'São Paulo', 'SP'),
('Franquia B', 'Santos', 'SP'),
('Franquia C', 'Guarulhos', 'SP'),
('Franquia D', 'Rio de Janeiro', 'RJ'),
('Franquia E', 'Cabo Frio', 'RJ');

-- Inserindo Locações
INSERT INTO Locacao (CarroId, ClienteId, FranquiaLocacaoId, FranquiaDevolucaoId, DataLocacao, DataDevolucao, QuilometragemInicial, QuilometragemFinal) VALUES
(1, 1, 1, 2, '2023-01-15', '2023-01-20', 5000, 5200),
(2, 2, 2, 1, '2023-02-10', '2023-02-15', 8000, 8050),
(3, 3, 3, 4, '2023-03-20', '2023-03-25', 6000, 6100),
(4, 4, 4, 3, '2023-04-05', '2023-04-10', 3000, 3050),
(5, 5, 5, 2, '2023-05-12', '2023-05-18', 7000, 7050),
(2, 1, 1, 2, '2023-06-01', '2023-06-05', 8100, 8135),
(3, 3, 3, 4, '2023-12-23', NULL, 6050, NULL),
(4, 5, 5, 2, '2023-08-20', '2023-08-25', 7050, 7090),
(1, 2, 2, 1, '2023-09-05', '2023-09-10', 5200, 5235),
(5, 4, 4, 3, '2023-12-23', NULL, 3100, NULL);