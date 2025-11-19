%%

%standalone
%class Analisador // Nome da classe Java que será gerada
%line
%column

%{

// Definição dos códigos internos dos tokens
public static final int KEYWORDPROG   = 1;
public static final int KEYWORDFINAL  = 2;
public static final int KEYWORDCLASS  = 3;
public static final int KEYWORDVOID   = 4;
public static final int KEYWORDIF     = 5;
public static final int KEYWORDELSE   = 6;
public static final int KEYWORDWHILE  = 7;
public static final int KEYWORDRETURN = 8;
public static final int KEYWORDREAD   = 9;
public static final int KEYWORDPRINT  = 10;
public static final int KEYWORDNEW    = 11;

public static final int IDENT         = 20;
public static final int NUMBER        = 21;
public static final int CHARCONST     = 22;
public static final int RELOP         = 23;
public static final int ADDOP         = 24;
public static final int MULOP         = 25;
public static final int SYMBOL        = 26;
public static final int OTHER         = 99;

%}

// Definições de padrões
Ident      = [a-zA-Z_][a-zA-Z0-9_]*
Number     = [0-9]+
CharConst  = '([^\\']|\\.)'
Whitespace = [ \t\r\n]+

// Palavras-chave
KWPROG   = program
KWFNAL   = final
KWCLASS  = class
KWVOID   = void
KWIF     = if
KWELSE   = else
KWWHILE  = while
KWRETURN = return
KWREAD   = read
KWPRINT  = print
KWNEW    = new

// Operadores e símbolos
Relop      = "=="|"!="|">="|">"|"<="|"<"
Addop      = "\+"|"-" 
Mulop      = "\*"|"/"|"%"
Symbols    = "\{"|"\}"|"\("|"\)"|"\["|"\]"|";"|","|"\."|"="

// Comentários
Comment    = "//"[^\n]* | "/\*"(.|\n)*?"\*/"

%%

// Ignora espaços e comentários
{Whitespace}   { /* ignora */ }
{Comment}      { /* ignora */ }

// Palavras-chave
{KWPROG}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDPROG + " (KEYWORDPROG): " + yytext()); return KEYWORDPROG; }
{KWFNAL}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDFINAL + " (KEYWORDFINAL): " + yytext()); return KEYWORDFINAL; }
{KWCLASS}    { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDCLASS + " (KEYWORDCLASS): " + yytext()); return KEYWORDCLASS; }
{KWVOID}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDVOID + " (KEYWORDVOID): " + yytext()); return KEYWORDVOID; }
{KWIF}       { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDIF + " (KEYWORDIF): " + yytext()); return KEYWORDIF; }
{KWELSE}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDELSE + " (KEYWORDELSE): " + yytext()); return KEYWORDELSE; }
{KWWHILE}    { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDWHILE + " (KEYWORDWHILE): " + yytext()); return KEYWORDWHILE; }
{KWRETURN}   { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDRETURN + " (KEYWORDRETURN): " + yytext()); return KEYWORDRETURN; }
{KWREAD}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDREAD + " (KEYWORDREAD): " + yytext()); return KEYWORDREAD; }
{KWPRINT}    { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDPRINT + " (KEYWORDPRINT): " + yytext()); return KEYWORDPRINT; }
{KWNEW}      { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + KEYWORDNEW + " (KEYWORDNEW): " + yytext()); return KEYWORDNEW; }

// Identificadores
{Ident}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + IDENT + " (Identificador): " + yytext()); return IDENT; }

// Constante numérica
{Number}    { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + NUMBER + " (Número): " + yytext()); return NUMBER; }

// Constante de caractere
{CharConst} { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + CHARCONST + " (CharConst): " + yytext()); return CHARCONST; }

// Operadores relacionais
{Relop}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + RELOP + " (Operador relacional): " + yytext()); return RELOP; }

// Operadores aritméticos
{Addop}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + ADDOP + " (Addop): " + yytext()); return ADDOP; }
{Mulop}     { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + MULOP + " (Mulop): " + yytext()); return MULOP; }

// Símbolos especiais
{Symbols}   { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + SYMBOL + " (Símbolo): " + yytext()); return SYMBOL; }

// Qualquer outro caractere
.           { System.out.println("Linha " + (yyline+1) + ", Coluna " + (yycolumn+1) + " -> TOKEN " + OTHER + " (Outro): " + yytext()); return OTHER; }
