%%

%standalone
%class exercicio2 // Nome da classe Java que será gerada

Letra = [a-zA-Z]
ParAB = ([ab]*)
Outro = .|\n

%%

{ParAB} {
	int countA = 0, countB = 0;
	for (int i = 0; i < yytext().length(); i++) {
		if (yytext().charAt(i) == 'a') countA++;
		if (yytext().charAt(i) == 'b') countB++;
	}
	if (countA % 2 == 0 && countB % 2 == 0 && yytext().length() > 0) {
		System.out.println("> Palavra com número par de 'a' e 'b': " + yytext());
	}
}
{Outro} {/* Ignora outros caracteres */}
