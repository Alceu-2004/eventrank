-- Usuários iniciais
INSERT INTO usuarios (nome, email, senha, data_criacao) 
VALUES ('Alice', 'alice@email.com', '$2a$10$6edf.Y9vLLdxjr3PaSxM3e56S3Tb0/93iaSaI3aHgCmCjfzR0fTPS', CURRENT_TIMESTAMP);

INSERT INTO usuarios (nome, email, senha, data_criacao) 
VALUES ('Bob', 'bob@email.com', '$2a$10$Q4rxHz57grX82b4GIEUidukzF/Pc5oPJ1QunsKcLF14MWsdR6i2aq', CURRENT_TIMESTAMP);

INSERT INTO usuarios (nome, email, senha, data_criacao) 
VALUES ('Admin', 'admin@email.com', '$2a$10$BwR1OGCmpnr2HYWIXep.5.5oOM//ESfHF42OI0uIyoOpyLMmlXs8K', CURRENT_TIMESTAMP);

-- Eventos iniciais
INSERT INTO eventos (nome, descricao, data_evento, local) 
VALUES ('Festival de Música de Juiz de Fora', 'Evento anual com apresentações de artistas locais e nacionais.', '2025-10-12 19:00:00', 'Parque Halfeld');

INSERT INTO eventos (nome, descricao, data_evento, local) 
VALUES ('Feira de Empreendedorismo e Inovação', 'Oportunidade para startups e empresas apresentarem suas soluções.', '2025-11-05 09:00:00', 'Expominas Juiz de Fora');

INSERT INTO eventos (nome, descricao, data_evento, local) 
VALUES ('Corrida da Cidade', 'Prova de rua tradicional de Juiz de Fora com percursos de 5km e 10km.', '2025-09-28 07:30:00', 'Avenida Rio Branco');
