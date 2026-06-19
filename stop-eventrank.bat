@echo off
title EventRank - Parando...
color 0C

echo.
echo ==========================================
echo   EventRank - Parando o sistema
echo ==========================================
echo.

:: =========================
:: 1. Parar processos Node (frontend)
:: =========================
echo [1/4] Parando frontend (Node/Vite)...

taskkill /F /IM node.exe >nul 2>&1

if %errorlevel%==0 (
    echo       Frontend parado
) else (
    echo       Nenhum frontend rodando
)

:: =========================
:: 2. Parar Java (backend)
:: =========================
echo [2/4] Parando backend (Java/Spring Boot)...

taskkill /F /IM java.exe >nul 2>&1

if %errorlevel%==0 (
    echo       Backend parado
) else (
    echo       Nenhum backend rodando
)

:: =========================
:: 3. Parar Docker (banco)
:: =========================
echo [3/4] Parando banco de dados (Docker)...

cd /d "%~dp0backend"
docker-compose down >nul 2>&1
echo       OK

:: =========================
:: 4. Reativar PostgreSQL local
:: =========================
echo [4/4] Reativando PostgreSQL local...
net start postgresql-x64-18 >nul 2>&1
echo       OK

echo.
echo ==========================================
echo   Sistema parado com sucesso!
echo ==========================================
echo.
pause