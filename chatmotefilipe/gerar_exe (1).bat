@echo off
title ChatMoteFilipe Launcher & Compiler
cls
echo ====================================================
echo               CHATMOTEFILIPE COMPILER
echo ====================================================
echo.
echo Opcao [1] : Executar App ChatMoteFilipe localmente
echo Opcao [2] : Gerar Executavel (.EXE) usando Nativefier (Requer Node.js)
echo.
set /p opt="Escolha uma opcao (1 ou 2): "

if "%opt%"=="1" (
    echo A abrir ChatMoteFilipe no navegador padrao...
    start chatmotefilipe.html
    exit
)

if "%opt%"=="2" (
    echo Verificar se o npm esta instalado...
    where npm >nul 2>nul
    if %errorlevel% neq 0 (
        echo Erro: O Node.js/npm nao foi encontrado no sistema.
        echo Instale o Node.js para converter o seu HTML num .EXE nativo.
        pause
        exit
    )
    echo Instalar o Nativefier globalmente se necessario...
    call npm install -g nativefier
    echo A compilar chatmotefilipe.html para ChatMoteFilipe.exe...
    call nativefier --name "ChatMoteFilipe" "chatmotefilipe.html"
    echo Processo concluido! Verifique a pasta gerada.
    pause
    exit
)

echo Opcao invalida.
pause
