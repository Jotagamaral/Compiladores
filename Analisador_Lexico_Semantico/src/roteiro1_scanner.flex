import java_cup.runtime.Symbol;

%%
%class Roteiro1_Scanner
%unicode
%cup
%line
%column
%public


digito = [0-9]
letra = [a-zA-Z]
digitos = [0-9]+

fimdeLinha = \r | \n | \r\n
espaco = {fimdeLinha} | [ \t\f ]

%%

{digitos} {
    double aux = Double.parseDouble(yytext());
    return new Symbol(sym.NUMBER, new Double(aux));
}

"+" { return new Symbol(sym.MAIS); }
"-" { return new Symbol(sym.MENOS); }

"/" { return new Symbol(sym.DIV); }
"*" { return new Symbol(sym.MULT); }

"%" { return new Symbol(sym.MOD); }

";" { return new Symbol(sym.PTVIRG); }

"(" { return new Symbol(sym.ABRE_PARENT); }
")" { return new Symbol(sym.FECHA_PARENT); }

{espaco} { /* despreza */ }

[∧] { /* Caractere inválido */
    return new Symbol(sym.EOF, yyline, yycolumn, yytext());
}