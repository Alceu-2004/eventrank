@echo off
title EventRank - Iniciando...
color 0A

echo.
echo ==========================================
echo   EventRank - Inicializacao do sistema
echo ==========================================
echo.

:: =========================
:: 1. Parar PostgreSQL local
:: =========================
echo [1/6] Parando PostgreSQL local...
net stop postgresql-x64-18 >nul 2>&1
echo       OK

:: =========================
:: 2. Subir Docker (banco)
:: =========================
echo [2/6] Subindo banco de dados (Docker)...
cd /d "%~dp0backend"
docker-compose up -d >nul 2>&1
echo       OK

:: =========================
:: 3. Aguardar banco
:: =========================
echo [3/6] Aguardando PostgreSQL ficar pronto...

set /a retries=0

:wait_db
timeout /t 1 >nul
docker exec eventrank-postgres pg_isready -U postgres >nul 2>&1

if %errorlevel%==0 (
    echo       Banco pronto!
    goto start_backend
)

set /a retries+=1
if %retries% GEQ 30 (
    echo       ERRO: Banco nao ficou pronto.
    pause
    exit /b
)

goto wait_db

:: =========================
:: 4. Backend
:: =========================
:start_backend
echo.
echo [4/6] Iniciando backend...
start "EventRank - Backend" cmd /k "cd /d "%~dp0backend" && .\mvnw.cmd spring-boot:run"

:: espera inicial do backend
timeout /t 12 >nul

:: =========================
:: 5. Frontend
:: =========================
echo [5/6] Instalando dependencias do frontend...
cd /d "%~dp0frontend"

call npm install

if %errorlevel% neq 0 (
    echo ERRO ao instalar dependencias do frontend
    pause
    exit /b
)

echo       OK

echo [6/6] Iniciando frontend...
start "EventRank - Frontend" cmd /k "cd /d "%~dp0frontend" && npm run dev"

:: =========================
:: 7. Aguardar frontend REALMENTE subir
:: =========================
echo.
echo Aguardando frontend subir...

:wait_frontend
timeout /t 2 >nul
curl -s http://localhost:5173 >nul 2>&1

if %errorlevel%==0 (
    goto open_browser
)

goto wait_frontend

:: =========================
:: 8. Abrir navegador
:: =========================
:open_browser
echo Frontend pronto! Abrindo navegador...

cmd /c start "" http://localhost:5173

echo.
echo ==========================================
echo   EventRank iniciado com sucesso!
echo ==========================================
echo.
pause