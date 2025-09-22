%%

%standalone
%class Analisador // Nome da classe Java que será gerada

// Definições de padrões
Ident      = [a-zA-Z_][a-zA-Z0-9_]*
Number     = [0-9]+
CharConst  = '([^\\']|\\.)'
Whitespace = [ \t\r\n]+

// Palavras-chave
KEYWORD    = program|final|class|void|if|else|while|return|read|print|new

// Operadores e símbolos
Relop      = "=="|"!="|">="|">"|"<="|"<"
Addop      = "\+"|"-" 
Mulop      = "\*"|"/"|"%"
Symbols    = "\{"|"\}"|"\("|"\)"|"\["|"\]"|";"|","|"\."|"="

// Comentários (opcional)
Comment    = "//"[^\n]* | "/\*"(.|\n)*?"\*/"

%%

// Ignora espaços e comentários
{Whitespace}   { /* ignora */ }
{Comment}      { /* ignora */ }

// Palavras-chave
{KEYWORD}      { System.out.println("> Palavra-chave: " + yytext()); }

// Identificadores
{Ident}        { System.out.println("> Identificador: " + yytext()); }

// Constante numérica
{Number}       { System.out.println("> Número: " + yytext()); }

// Constante de caractere
{CharConst}    { System.out.println("> Constante de caractere: " + yytext()); }

// Operadores relacionais
{Relop}        { System.out.println("> Operador relacional: " + yytext()); }

// Operadores aritméticos
{Addop}        { System.out.println("> Operador adição/subtração: " + yytext()); }
{Mulop}        { System.out.println("> Operador multiplicação/divisão: " + yytext()); }

// Símbolos especiais
{Symbols}      { System.out.println("> Símbolo: " + yytext()); }

// Qualquer outro caractere
.              { System.out.println("> Outro: " + yytext()); }
