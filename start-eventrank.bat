@echo off
title EventRank - Iniciando...
color 0A

echo.
echo  ==========================================
echo   EventRank - Iniciando o projeto...
echo  ==========================================
echo.

:: Parar PostgreSQL local para liberar porta 5432
echo [1/4] Parando PostgreSQL local...
net stop postgresql-x64-18 >nul 2>&1
echo       OK

:: Subir banco Docker
echo [2/4] Subindo banco de dados (Docker)...
cd /d "%~dp0backend"
docker-compose up -d >nul 2>&1
echo       OK

:: Aguardar banco ficar pronto
echo [3/4] Aguardando banco ficar pronto...
timeout /t 3 /nobreak >nul
echo       OK

:: Subir backend em nova janela
echo [4/4] Iniciando backend (Spring Boot)...
start "EventRank - Backend" cmd /k "cd /d "%~dp0backend" && .\mvnw.cmd spring-boot:run"

:: Aguardar backend inicializar
echo.
echo  Aguardando backend inicializar (15s)...
timeout /t 15 /nobreak >nul

:: Subir frontend em nova janela
echo  Iniciando frontend (Vite)...
start "EventRank - Frontend" cmd /k "cd /d "%~dp0frontend" && npm run dev"

echo.
echo  ==========================================
echo   Tudo iniciado! Acesse:
echo   http://localhost:5173
echo  ==========================================
echo.
pause
