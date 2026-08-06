-- =========================================
-- Criação da tabela EVENTOS
-- =========================================
CREATE TABLE IF NOT EXISTS eventos (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(500),
    data_evento TIMESTAMP NOT NULL,
    local VARCHAR(255)
);

-- =========================================
-- Criação da tabela AVALIACOES
-- =========================================
CREATE TABLE IF NOT EXISTS avaliacoes (
    id BIGSERIAL PRIMARY KEY,
    comentario VARCHAR(255) NOT NULL,
    nota INTEGER NOT NULL,
    usuario_id BIGINT NOT NULL REFERENCES usuarios(id),
    evento_id BIGINT REFERENCES eventos(id),
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
