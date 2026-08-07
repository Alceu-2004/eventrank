# EventRank

🔗 **Demo ao vivo:** [eventrank.vercel.app](https://eventrank.vercel.app)
📦 **API:** hospedada no Render (Docker) — ver seção [Deploy em Produção](#deploy-em-produção)

> ⚠️ O backend roda no plano gratuito do Render, que hiberna após períodos de inatividade. A primeira requisição depois de um tempo parado pode levar de 30 a 60 segundos para responder — isso é esperado, não é bug.

Sistema fullstack para **avaliação de eventos culturais**. Usuários podem se cadastrar, explorar eventos, deixar comentários e notas — gerando um ranking colaborativo baseado na experiência real do público.

Desenvolvido como projeto de portfólio com foco em boas práticas de desenvolvimento e design profissional.

---

## Tecnologias

**Backend**
- Java 17 · Spring Boot 3 · Spring Security · JWT
- JPA / Hibernate · Flyway · PostgreSQL

**Frontend**
- React 19 · TypeScript · Vite
- CSS customizado com design system (variáveis, tema dark)
- Axios · Lucide Icons · React Router DOM

**Infraestrutura**
- Docker · Docker Compose · Maven

---

## Estrutura do Projeto

```
eventrank/
├── backend/              # API REST (Spring Boot)
├── frontend/             # Interface web (React + TypeScript)
├── start-eventrank.bat   # Script para iniciar o ambiente (Windows)
└── stop-eventrank.bat    # Script para parar o ambiente (Windows)
```

---

## Como Rodar

### Pré-requisitos

- [Java 17](https://adoptium.net)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Node.js](https://nodejs.org) (v18+)

> **Windows:** se você tiver o PostgreSQL instalado localmente, ele pode conflitar com o Docker na porta 5432. Os scripts `.bat` já cuidam disso automaticamente.

---

### Opção 1 — Script automático (Windows)

Na raiz do projeto, clique com o botão direito em `start-eventrank.bat` e execute como **administrador**.

O script irá:
1. Parar o PostgreSQL local (se houver) para liberar a porta 5432
2. Subir o banco de dados via Docker
3. Iniciar o backend em uma nova janela
4. Iniciar o frontend em uma nova janela

Acesse em: `http://localhost:5173`

Para parar tudo, execute `stop-eventrank.bat` como administrador.

---

### Opção 2 — Manual

**1. Banco de dados**
```bash
cd backend
docker-compose up -d
```

**2. Backend**
```bash
cd backend
./mvnw spring-boot:run
# Windows:
.\mvnw.cmd spring-boot:run
```

As migrations do Flyway são aplicadas automaticamente na primeira execução, incluindo dados de exemplo.

API disponível em: `http://localhost:8080`

**3. Frontend**
```bash
cd frontend
npm install
npm run dev
```

Interface disponível em: `http://localhost:5173`

---

## Deploy em Produção

O projeto está publicado usando uma stack 100% gratuita, com backend e frontend separados:

| Camada | Serviço | Por quê |
|---|---|---|
| **Banco de dados** | [Neon](https://neon.tech) | PostgreSQL serverless, free tier sem expiração |
| **Backend** | [Render](https://render.com) | Deploy via Docker a partir do `Dockerfile` em `backend/` |
| **Frontend** | [Vercel](https://vercel.com) | Build estático do Vite, deploy automático a cada push |

**Arquitetura:**

```
Usuário → Vercel (React/Vite, estático)
              │
              ▼  HTTPS (VITE_API_URL)
          Render (Spring Boot, Docker)
              │
              ▼  JDBC/SSL
           Neon (PostgreSQL)
```

### Variáveis de ambiente

O backend não tem nenhuma credencial fixa no código — tudo é lido de variáveis de ambiente configuradas diretamente no painel do Render:

| Variável | Descrição |
|---|---|
| `SPRING_DATASOURCE_URL` | URL JDBC do banco (conexão **direta** do Neon, não a pooled — o Flyway precisa de locks incompatíveis com o pooler) |
| `SPRING_DATASOURCE_USERNAME` | Usuário do banco |
| `SPRING_DATASOURCE_PASSWORD` | Senha do banco |
| `JWT_SECRET` | Chave usada para assinar os tokens JWT (gerada com `openssl rand -base64 64`) |
| `CORS_ALLOWED_ORIGINS` | URL do frontend publicado, para liberar as requisições do navegador |

O frontend usa uma única variável, configurada no painel do Vercel:

| Variável | Descrição |
|---|---|
| `VITE_API_URL` | URL pública do backend no Render |

Veja `backend/.env.example` e `frontend/.env.example` para referência completa.

### Detalhes técnicos do deploy

- O `frontend/vercel.json` reescreve todas as rotas para `index.html`, necessário porque a navegação (React Router) acontece no cliente — sem isso, recarregar a página em uma rota como `/dashboard` retorna 404.
- O `application.properties` usa `spring.jpa.hibernate.ddl-auto=validate` em vez de `update`: em produção, apenas o Flyway tem permissão para alterar o schema do banco.
- Histórico do Git foi higienizado com `git filter-repo` para remover credenciais que ficaram commitadas por engano durante o desenvolvimento local, sem perder o histórico de commits original.

---

## Funcionalidades

- Cadastro e login com autenticação JWT
- Listagem e busca de eventos
- Avaliação com nota (1–5 estrelas) e comentário
- Média de avaliações por evento
- Interface responsiva com tema dark profissional

---

## Licença

Projeto de uso educacional, parte do portfólio pessoal de **Alceu-2004**.
