# 🎤 EventRank

**EventRank** é um sistema completo para **avaliação de artistas e eventos culturais**.
A plataforma permite que usuários realizem avaliações, comentários e consultem rankings com base nas notas atribuídas.

Este é um projeto **fullstack**, desenvolvido com foco em **aprendizado prático e portfólio profissional**.

---

## 📂 Estrutura do Projeto

```bash
eventrank/
├── backend/   # API REST com Spring Boot
├── frontend/  # Interface web completa com React.js e TypeScript
└── README.md  # Apresentação do projeto
```

---

## 🧠 Tecnologias Utilizadas

* **Backend:** Java · Spring Boot · JPA · Flyway · PostgreSQL · JWT
* **Frontend:** React.js · TypeScript · Axios · Lucide Icons · CSS customizado
* **DevOps:** Docker · Docker Compose
* **Ferramentas:** Maven · pgAdmin · Postman

---

## 🚀 Como Rodar o Projeto

### 🔧 Pré-requisitos

* Docker & Docker Compose
* Java 23
* Maven
* Node.js (para o frontend)

---

### 🔹 Backend com Docker Compose

1. Crie o arquivo `.env` a partir do modelo:

   ```bash
   cp backend/.env.example backend/.env
   ```

2. Preencha as variáveis de ambiente em `backend/.env`:

   ```bash
   DB_USER=usuario
   DB_PASS=senha
   DB_NAME=eventrank
   DB_PORT=5432
   ```

3. Inicie os containers do Docker:

   ```bash
   docker-compose up -d
   ```

   O backend estará disponível em:
   👉 `http://localhost:8080`

   As migrations do banco de dados são aplicadas automaticamente pelo **Flyway**.

---

### 🔹 Frontend

1. Navegue até a pasta `frontend/`:

   ```bash
   cd frontend
   ```

2. Instale as dependências:

   ```bash
   npm install
   ```

3. Inicie a aplicação:

   ```bash
   npm start
   ```

   A interface web estará disponível em:
   👉 `http://localhost:5173/`

   A aplicação já está integrada com o backend.

---

### 🔹 pgAdmin (opcional)

Se quiser gerenciar o banco de dados via pgAdmin:

1. Configure o acesso ao PostgreSQL usando as variáveis definidas no `.env`.
2. Conecte-se ao host `localhost` e porta `5432`.

---

## 📈 Status do Projeto

🟢 **Backend completo** — API REST funcional com PostgreSQL e Flyway
🟢 **Frontend completo** — Interface web interativa em React + TypeScript integrada à API

---

## 🧩 Funcionalidades

* Cadastro e login de usuários com autenticação JWT
* Avaliação e comentários de eventos
* Consulta de eventos e rankings
* Pesquisa e filtro de eventos
* Menu dinâmico com opções de navegação
* Dashboard de avaliações por evento

---

## 📄 Licença

Este projeto é de uso educacional e faz parte do portfólio pessoal de **Alceu-2004**.
