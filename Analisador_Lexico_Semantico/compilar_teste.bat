@echo off
cls

:: --- CONFIGURAÇÃO ---
set LIB_DIR=lib
set SRC_DIR=src
set BUILD_DIR=build
set CLASSES_DIR=%BUILD_DIR%\classes
set GEN_DIR=%BUILD_DIR%\generated

:: --- LIMPEZA ---
:: Remove a pasta build antiga para garantir uma compilação limpa
if exist %BUILD_DIR% rmdir /s /q %BUILD_DIR%
mkdir %CLASSES_DIR%
mkdir %GEN_DIR%

if not defined JFLEX_HOME set JFLEX_HOME=C:\Users\Admin\Documents\Compiladores\jflex-1.9.1\jflex-1.9.1
if not defined JFLEX_VERSION set JFLEX_VERSION=1.9.1


echo [1/4] Gerando Analisador Lexico (JFlex)...
:: CORREÇÃO: Chamamos o JAR direto. Adicionamos -d %GEN_DIR% para o arquivo ir para a pasta certa.
java -Xmx128m -jar %JFLEX_HOME%\lib\jflex-full-%JFLEX_VERSION%.jar -d %GEN_DIR% %SRC_DIR%\teste.flex

echo [2/4] Gerando Analisador Sintatico (Java Cup)...
:: O -destdir joga os arquivos gerados na pasta gen
java -jar %LIB_DIR%\java-cup-11b.jar -destdir %GEN_DIR% -parser parser -symbols sym %SRC_DIR%\ex02.cup

echo [3/4] Compilando arquivos Java...
:: Compila o Main (do src) e o Scanner/Parser (do gen) jogando os .class no classes_dir
javac -cp "%LIB_DIR%\java-cup-11b.jar" -d %CLASSES_DIR% %SRC_DIR%\Main.java %GEN_DIR%\*.java

echo [4/4] Executando...
echo.
echo Entrada: %~1
echo Resultado:
:: O %~1 pega o primeiro argumento passado no comando e remove as aspas
echo %~1 | java -cp "%CLASSES_DIR%;%LIB_DIR%\java-cup-11b.jar" Main

echo.