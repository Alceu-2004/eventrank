@echo off
title EventRank - Parando...
color 0C

echo.
echo  ==========================================
echo   EventRank - Parando o projeto...
echo  ==========================================
echo.

:: Parar Docker
echo [1/2] Parando banco de dados (Docker)...
cd /d "%~dp0backend"
docker-compose down >nul 2>&1
echo       OK

:: Reiniciar PostgreSQL local
echo [2/2] Reativando PostgreSQL local...
net start postgresql-x64-18 >nul 2>&1
echo       OK

echo.
echo  ==========================================
echo   Projeto parado com sucesso!
echo  ==========================================
echo.
pause
