import java_cup.runtime.Symbol;
class sym {
    public static final int EOF = -1;
    public static final int INTEIRO = 1;
    public static final int IDENT = 2;
}

%%

%class exemplo1_JCUP
%unicode
%cup
%line
%column
%debug

Digito = [0-9]
Letra = [a-zA-Z]
Ident = {Letra}*
Inteiro = {Digito}+

%%

{Ident} {
    return new Symbol(sym.IDENT, yyline, yycolumn, yytext());
}

{Inteiro}  {
    int aux = Integer.parseInt (yytext());
    Symbol s = new Symbol(sym.INTEIRO, yyline, yycolumn, new Integer(aux));
    return s;
}

[^] {
    Symbol s = new Symbol(sym.EOF, yyline, yycolumn, yytext());
    return s;
}
