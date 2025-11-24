/* Analisador.flex (Versão para Java Cup) */
import java_cup.runtime.Symbol; // Importação necessária

%%

%class Analisador
%unicode
%cup   /* TROCADO: de %standalone para %cup */
%line
%column

%{
  /* Função auxiliar para criar o Objeto Symbol.
     O Java Cup precisa receber um Symbol, não um int.
  */
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}

/* As definições manuais de 'public static final int...' FORAM REMOVIDAS.
   Agora usamos a classe 'sym' gerada pelo Java Cup. */

Ident      = [a-zA-Z_][a-zA-Z0-9_]*
Number     = [0-9]+
CharConst  = '([^\\']|\\.)'
Whitespace = [ \t\r\n]+

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

Relop      = "=="|"!="|">="|">"|"<="|"<"
Addop      = "\+"|"-" 
Mulop      = "\*"|"/"|"%"
Symbols    = "\{"|"\}"|"\("|"\)"|"\["|"\]"|";"|","|"\."|"="

Comment    = "//"[^\n]* | "/*" ~"*/"
%%

/* Regras */

{Whitespace}   { /* ignora */ }
{Comment}      { /* ignora */ }

/* Retorna Symbols usando as constantes da classe 'sym' */

{KWPROG}     { return symbol(sym.KEYWORDPROG, yytext()); }
{KWFNAL}     { return symbol(sym.KEYWORDFINAL, yytext()); }
{KWCLASS}    { return symbol(sym.KEYWORDCLASS, yytext()); }
{KWVOID}     { return symbol(sym.KEYWORDVOID, yytext()); }
{KWIF}       { return symbol(sym.KEYWORDIF, yytext()); }
{KWELSE}     { return symbol(sym.KEYWORDELSE, yytext()); }
{KWWHILE}    { return symbol(sym.KEYWORDWHILE, yytext()); }
{KWRETURN}   { return symbol(sym.KEYWORDRETURN, yytext()); }
{KWREAD}     { return symbol(sym.KEYWORDREAD, yytext()); }
{KWPRINT}    { return symbol(sym.KEYWORDPRINT, yytext()); }
{KWNEW}      { return symbol(sym.KEYWORDNEW, yytext()); }

{Ident}      { return symbol(sym.IDENT, yytext()); }
{Number}     { return symbol(sym.NUMBER, yytext()); }
{CharConst}  { return symbol(sym.CHARCONST, yytext()); }

{Relop}      { return symbol(sym.RELOP, yytext()); }
{Addop}      { return symbol(sym.ADDOP, yytext()); }
{Mulop}      { return symbol(sym.MULOP, yytext()); }
{Symbols}    { return symbol(sym.SYMBOL, yytext()); }

.            { return symbol(sym.OTHER, yytext()); }