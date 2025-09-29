# 🎤 EventRank

**EventRank** é um sistema completo para avaliação de artistas e eventos culturais. A plataforma permite que usuários realizem avaliações, comentários e consultem rankings com base nas notas atribuídas. É um projeto fullstack, desenvolvido com foco em aprendizado e portfólio.

## 📂 Estrutura do Projeto

```bash
eventrank/
├── backend/   # API REST com Spring Boot
├── frontend/  # Interface web com React.js
└── README.md  # Apresentação do projeto
```

## 🚀 Rodando o Projeto

### Pré-requisitos

* Docker & Docker Compose
* Java 23
* Maven
* Node.js (para o frontend)

### 🔹 Backend com Docker Compose

1. Crie um arquivo `.env` a partir do `.env.example`:

cp backend/.env.example backend/.env


2. Preencha as variáveis de ambiente em `backend/.env`:

DB_USER=usuario
DB_PASS=senha
DB_NAME=eventrank
DB_PORT=5432


3. Inicie os containers do Docker:

docker-compose up -d

O backend estará disponível em: `http://localhost:8080`

As migrations do banco de dados são aplicadas automaticamente pelo Flyway.

### 🔹 pgAdmin (Opcional)

Se quiser gerenciar o banco de dados via pgAdmin:

1. Configure o acesso ao PostgreSQL usando as variáveis definidas no `.env`.
2. Conecte-se ao host `localhost` e porta `5432`.
