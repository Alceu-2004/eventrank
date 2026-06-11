# EventRank

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

## Funcionalidades

- Cadastro e login com autenticação JWT
- Listagem e busca de eventos
- Avaliação com nota (1–5 estrelas) e comentário
- Média de avaliações por evento
- Interface responsiva com tema dark profissional

---

## Licença

Projeto de uso educacional, parte do portfólio pessoal de **Alceu-2004**.
