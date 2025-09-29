-- =========================================
-- Usuário administrador inicial
-- senha: admin123 (hash BCrypt)
-- =========================================
INSERT INTO usuarios (nome, email, senha)
VALUES (
    'Administrador',
    'admin@example.com',
    '$2a$10$7Qp0H.9RCf4O9YQldAnZ5uXb6DJquAIQtFf.2xPhF7zJPMvOvAwOm'
);