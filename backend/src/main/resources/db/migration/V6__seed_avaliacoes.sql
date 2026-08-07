-- =========================================
-- Avaliações de exemplo, associadas aos usuários demo
-- =========================================
INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Gostei bastante, só senti falta de mais opções de transporte no local.', 3, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Rock in Rio 2024'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Rock in Rio 2024');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 5, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'CCXP 2024'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'CCXP 2024');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Experiência incrível, superou minhas expectativas em todos os aspectos.', 4, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Lollapalooza Brasil 2024'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Lollapalooza Brasil 2024');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Evento muito bem planejado, filas rápidas e boa sinalização no local.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Lollapalooza Brasil 2024'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Lollapalooza Brasil 2024');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Fiquei impressionado com a qualidade das atrações e da estrutura.', 5, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Lollapalooza Brasil 2024'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Lollapalooza Brasil 2024');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Programação boa, mas a estrutura de banheiros poderia ser melhor.', 4, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival Gastronômico de Tiradentes'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival Gastronômico de Tiradentes');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Esperava mais organização, tivemos que esperar muito tempo nas filas.', 3, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Carnaval de Salvador 2024'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Carnaval de Salvador 2024');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Fiquei impressionado com a qualidade das atrações e da estrutura.', 5, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Réveillon de Copacabana 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Réveillon de Copacabana 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Evento muito bem planejado, filas rápidas e boa sinalização no local.', 4, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'Carnaval de Salvador 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Carnaval de Salvador 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Vale cada centavo, momentos inesquecíveis com a família e amigos.', 5, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Carnaval do Rio de Janeiro 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Carnaval do Rio de Janeiro 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Bom evento, mas achei o preço da comida um pouco salgado.', 4, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Marchá de Frevo de Olinda 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Marchá de Frevo de Olinda 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Experiência positiva no geral, com alguns pontos de melhoria na logística.', 3, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Marchá de Frevo de Olinda 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Marchá de Frevo de Olinda 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Vale cada centavo, momentos inesquecíveis com a família e amigos.', 5, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Marchá de Frevo de Olinda 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Marchá de Frevo de Olinda 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Fiquei impressionado com a qualidade das atrações e da estrutura.', 5, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Lollapalooza Brasil 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Lollapalooza Brasil 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Ambiente muito bem cuidado e programação diversa, recomendo demais.', 5, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'São Paulo Fashion Week 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'São Paulo Fashion Week 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Ambiente muito bem cuidado e programação diversa, recomendo demais.', 5, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Virada Cultural de São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Virada Cultural de São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Experiência positiva no geral, com alguns pontos de melhoria na logística.', 4, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Inverno de Campos do Jordão 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Inverno de Campos do Jordão 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Vale cada centavo, momentos inesquecíveis com a família e amigos.', 4, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Inverno de Campos do Jordão 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Inverno de Campos do Jordão 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Adorei a energia do público e a qualidade das apresentações.', 5, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festa Junina de Campina Grande 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festa Junina de Campina Grande 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Fiquei impressionado com a qualidade das atrações e da estrutura.', 5, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Bumba Meu Boi de São Luís 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Bumba Meu Boi de São Luís 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Adorei a energia do público e a qualidade das apresentações.', 4, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival Folclórico de Parintins 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival Folclórico de Parintins 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 4, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival Folclórico de Parintins 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival Folclórico de Parintins 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Evento muito bem planejado, filas rápidas e boa sinalização no local.', 4, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival Folclórico de Parintins 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival Folclórico de Parintins 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Fiquei impressionado com a qualidade das atrações e da estrutura.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Rock in Rio 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Rock in Rio 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Faltou informação clara sobre horários e localização das atrações.', 2, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Rock in Rio 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Rock in Rio 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Programação boa, mas a estrutura de banheiros poderia ser melhor.', 4, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Rock in Rio 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Rock in Rio 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Experiência incrível, superou minhas expectativas em todos os aspectos.', 5, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'The Town 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'The Town 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Fiquei impressionado com a qualidade das atrações e da estrutura.', 4, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Primavera Sound São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Primavera Sound São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Gostei bastante, só senti falta de mais opções de transporte no local.', 3, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Primavera Sound São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Primavera Sound São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Faltou informação clara sobre horários e localização das atrações.', 2, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Villa Mix Goiânia 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Villa Mix Goiânia 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 4, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Villa Mix Goiânia 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Villa Mix Goiânia 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 5, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festa do Peão de Barretos 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festa do Peão de Barretos 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 5, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festa do Peão de Barretos 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festa do Peão de Barretos 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'A estrutura ficou aquém do esperado para um evento desse porte.', 2, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Oktoberfest Blumenau 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Oktoberfest Blumenau 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Evento muito bem planejado, filas rápidas e boa sinalização no local.', 5, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'Oktoberfest Blumenau 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Oktoberfest Blumenau 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Faltou informação clara sobre horários e localização das atrações.', 2, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Oktoberfest Blumenau 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Oktoberfest Blumenau 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Adorei a energia do público e a qualidade das apresentações.', 5, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival Gastronômico de Tiradentes 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival Gastronômico de Tiradentes 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 4, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival Gastronômico de Tiradentes 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival Gastronômico de Tiradentes 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Ambiente muito bem cuidado e programação diversa, recomendo demais.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Bienal Internacional do Livro de São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Bienal Internacional do Livro de São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Experiência incrível, superou minhas expectativas em todos os aspectos.', 5, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Bienal Internacional do Livro de São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Bienal Internacional do Livro de São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Esperava mais organização, tivemos que esperar muito tempo nas filas.', 3, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Bienal do Livro do Rio de Janeiro 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Bienal do Livro do Rio de Janeiro 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Adorei a energia do público e a qualidade das apresentações.', 4, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Cinema de Gramado 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Cinema de Gramado 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Evento muito bem planejado, filas rápidas e boa sinalização no local.', 5, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Cinema de Gramado 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Cinema de Gramado 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Evento muito bem planejado, filas rápidas e boa sinalização no local.', 4, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Cinema de Gramado 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Cinema de Gramado 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Experiência incrível, superou minhas expectativas em todos os aspectos.', 5, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Mostra Internacional de Cinema de São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Mostra Internacional de Cinema de São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Bom evento, mas achei o preço da comida um pouco salgado.', 3, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'Mostra Internacional de Cinema de São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Mostra Internacional de Cinema de São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Gostei bastante, só senti falta de mais opções de transporte no local.', 3, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'CCXP 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'CCXP 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Adorei a energia do público e a qualidade das apresentações.', 5, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'CCXP 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'CCXP 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Ambiente muito bem cuidado e programação diversa, recomendo demais.', 5, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Anime Friends 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Anime Friends 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Bom evento, mas achei o preço da comida um pouco salgado.', 3, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Comic Con Experience Brasília 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Comic Con Experience Brasília 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Adorei a energia do público e a qualidade das apresentações.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Campus Party Brasil 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Campus Party Brasil 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Experiência incrível, superou minhas expectativas em todos os aspectos.', 5, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'Campus Party Brasil 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Campus Party Brasil 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Evento muito bem planejado, filas rápidas e boa sinalização no local.', 4, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Campus Party Brasil 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Campus Party Brasil 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Adorei a energia do público e a qualidade das apresentações.', 5, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Web Summit Rio 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Web Summit Rio 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Ambiente muito bem cuidado e programação diversa, recomendo demais.', 5, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Web Summit Rio 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Web Summit Rio 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Programação boa, mas a estrutura de banheiros poderia ser melhor.', 3, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'RD Summit 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'RD Summit 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Um dos melhores eventos que já participei, vale muito a pena.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Futurecom 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Futurecom 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 4, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'São Paulo Tech Week 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'São Paulo Tech Week 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Ambiente muito bem cuidado e programação diversa, recomendo demais.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'GP Brasil de Fórmula 1 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'GP Brasil de Fórmula 1 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 4, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'GP Brasil de Fórmula 1 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'GP Brasil de Fórmula 1 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Vale cada centavo, momentos inesquecíveis com a família e amigos.', 5, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'GP Brasil de Fórmula 1 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'GP Brasil de Fórmula 1 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Um dos melhores eventos que já participei, vale muito a pena.', 5, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Rio Open 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Rio Open 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Experiência positiva no geral, com alguns pontos de melhoria na logística.', 4, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Rio Open 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Rio Open 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Maratona Internacional de São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Maratona Internacional de São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Fiquei impressionado com a qualidade das atrações e da estrutura.', 4, (SELECT id FROM usuarios WHERE email = 'thiago.martins@demo.com'), (SELECT id FROM eventos WHERE nome = 'Maratona Internacional de São Paulo 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'thiago.martins@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Maratona Internacional de São Paulo 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Programação boa, mas a estrutura de banheiros poderia ser melhor.', 3, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Meia Maratona Internacional do Rio 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Meia Maratona Internacional do Rio 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Válido participar, apesar da superlotação em alguns horários.', 4, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Copa São Paulo de Futebol Júnior 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Copa São Paulo de Futebol Júnior 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Faltou informação clara sobre horários e localização das atrações.', 2, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Copa São Paulo de Futebol Júnior 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Copa São Paulo de Futebol Júnior 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Um dos melhores eventos que já participei, vale muito a pena.', 4, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Réveillon de Fernando de Noronha 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Réveillon de Fernando de Noronha 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Ambiente muito bem cuidado e programação diversa, recomendo demais.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Réveillon de Fernando de Noronha 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Réveillon de Fernando de Noronha 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Programação boa, mas a estrutura de banheiros poderia ser melhor.', 3, (SELECT id FROM usuarios WHERE email = 'bruno.alves@demo.com'), (SELECT id FROM eventos WHERE nome = 'Réveillon de Fernando de Noronha 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'bruno.alves@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Réveillon de Fernando de Noronha 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Fiquei impressionado com a qualidade das atrações e da estrutura.', 5, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Verão de Salvador 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Verão de Salvador 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Um dos melhores eventos que já participei, vale muito a pena.', 5, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Verão de Salvador 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Verão de Salvador 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Um dos melhores eventos que já participei, vale muito a pena.', 5, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Verão de Salvador 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Verão de Salvador 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Organização impecável, com certeza vou voltar no próximo ano.', 4, (SELECT id FROM usuarios WHERE email = 'juliana.ferreira@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festa de Iemanjá 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'juliana.ferreira@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festa de Iemanjá 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Faltou informação clara sobre horários e localização das atrações.', 2, (SELECT id FROM usuarios WHERE email = 'rafael.costa@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festa de Iemanjá 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'rafael.costa@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festa de Iemanjá 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Evento muito bem planejado, filas rápidas e boa sinalização no local.', 4, (SELECT id FROM usuarios WHERE email = 'fernanda.lima@demo.com'), (SELECT id FROM eventos WHERE nome = 'Círio de Nazaré 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'fernanda.lima@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Círio de Nazaré 2026');

INSERT INTO avaliacoes (comentario, nota, usuario_id, evento_id, data_criacao)
SELECT 'Vale cada centavo, momentos inesquecíveis com a família e amigos.', 4, (SELECT id FROM usuarios WHERE email = 'camila.souza@demo.com'), (SELECT id FROM eventos WHERE nome = 'Festival de Dança de Joinville 2026'), CURRENT_TIMESTAMP - (random() * interval '120 days')
WHERE EXISTS (SELECT 1 FROM usuarios WHERE email = 'camila.souza@demo.com') AND EXISTS (SELECT 1 FROM eventos WHERE nome = 'Festival de Dança de Joinville 2026');

