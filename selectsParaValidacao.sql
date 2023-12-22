-- Selecionar todas as Categorias
SELECT * FROM Categoria;

-- Selecionar todos os Carros
SELECT * FROM Carro;

-- Selecionar todos os Clientes
SELECT * FROM Cliente;

-- Selecionar todas as Franquias
SELECT * FROM Franquia;

-- Selecionar todos as Locações
SELECT * FROM Locacao;

-- Exibir apenas as colunas modelo, montadora, cor e versão da tabela de Carros
SELECT Modelo, Montadora, Cor, Versao FROM Carro;

-- Exibir carros de uma determinada cor existente e exibir apenas as colunas modelo, montadora, cor e versão
SELECT Modelo, Montadora, Cor, Versao FROM Carro WHERE Cor = 'Branco';

-- Inserir carro de uma cor diferente das estabelecidas.
INSERT INTO Carro (Modelo, Montadora, Cor, Versao, StatusLocacaoCarro, QuilometragemAtual, CategoriaId) VALUES
('Gol', 'Volkswagen', 'Vermelho', '1.2 TSI', 'Disponivel', 2000, 1);

-- Histórico de locação de um carro específico
SELECT c.Modelo, l.DataLocacao, l.DataDevolucao, l.QuilometragemInicial, l.QuilometragemFinal
FROM Carro c
JOIN Locacao l ON c.CarroId = l.CarroId
WHERE c.CarroId = 2;

-- Histórico de quilometragem de um cliente com um carro específico.
SELECT c.Modelo, cl.Nome, l.QuilometragemInicial, l.QuilometragemFinal
FROM Carro c
JOIN Locacao l ON c.CarroId = l.CarroId
JOIN Cliente cl ON cl.ClienteId = l.ClienteId
WHERE cl.ClienteId = 3 AND c.CarroId = 3;

-- Consultar locações com informações sobre a franquia de locação e devolução.
SELECT l.LocacaoId, c.Modelo, f_loc.Nome AS FranquiaLocacao, f_dev.Nome AS FranquiaDevolucao
FROM Locacao l
JOIN Carro c ON l.CarroId = c.CarroId
JOIN Franquia f_loc ON l.FranquiaLocacaoId = f_loc.FranquiaId
JOIN Franquia f_dev ON l.FranquiaDevolucaoId = f_dev.FranquiaId;

-- Histórico de clientes que locaram um carro específico.
SELECT c.Modelo, cl.Nome AS NomeCliente, l.DataLocacao, l.DataDevolucao
FROM Carro c
JOIN Locacao l ON c.CarroId = l.CarroId
JOIN Cliente cl ON l.ClienteId = cl.ClienteId
WHERE c.CarroId = 5;

-- Histórico de carros alugados por um determinado cliente.
SELECT cl.Nome AS NomeCliente, c.Modelo, l.DataLocacao, l.DataDevolucao
FROM Cliente cl
JOIN Locacao l ON cl.ClienteId = l.ClienteId
JOIN Carro c ON l.CarroId = c.CarroId
WHERE cl.ClienteId = 5;

-- Cliente pode alugar carro somente na modalidade diária.
SELECT LocacaoId, ClienteId, DataLocacao, DataDevolucao FROM Locacao;

-- Enquanto um carro estiver locado, cliente não pode alugar.
SELECT * FROM Cliente WHERE StatusLocacaoCliente = 'Com Carro Alugado';

-- Histórico de informações sobre locações de carros, incluindo as datas de locação e devolução, quilometragem inicial e final, além dos nomes das franquias de locação e devolução associadas a cada locação.
SELECT lc.LocacaoId, lc.DataLocacao, lc.DataDevolucao, lc.QuilometragemInicial, lc.QuilometragemFinal,
       fl.Nome AS FranquiaLocacaoNome, fd.Nome AS FranquiaDevolucaoNome
FROM Locacao lc
JOIN Franquia fl ON lc.FranquiaLocacaoId = fl.FranquiaId
LEFT JOIN Franquia fd ON lc.FranquiaDevolucaoId = fd.FranquiaId;

-- Histórico de onde o carro foi locado e onde foi devolvido.
SELECT c.Modelo AS CarroModelo, FLocacao.Cidade AS CidadeLocacao, FLocacao.Estado AS EstadoLocacao
FROM Locacao l
INNER JOIN Carro c ON l.CarroId = c.CarroId
INNER JOIN Franquia FLocacao ON l.FranquiaLocacaoId = FLocacao.FranquiaId;

-- Quilometragem atual de cada um dos carros.
SELECT CarroId, Modelo, QuilometragemAtual
FROM Carro;