// -------------------------------------------------------------------------
// Seção de Opções e Declarações
// -------------------------------------------------------------------------
%%

// Diretivas JFlex
%standalone // Gera um arquivo .java com um método main() para testes
%class MiniLangAnalisador // Nome da classe Java que será gerada
%line // Habilita a contagem de linhas (acessível via a variável 'yyline')
%column // Habilita a contagem de colunas (acessível via a variável 'yycolumn')

// Definições de Macros (atalhos)
LineTerminator = \r|\n|\r\n
Whitespace     = {LineTerminator} | [ \t\f]

// Um Identificador começa com uma letra ou underscore, seguido por mais letras,
// números ou underscores. Esta é a definição padrão em muitas linguagens.
Identifier     = [a-zA-Z_][a-zA-Z_0-9]*

// Um número inteiro é uma sequência de um ou mais dígitos.
IntegerLiteral = [0-9]+

// Comentário de linha única: começa com // e vai até o fim da linha.
Comment        = \/\/[^\r\n]*

%%

// -------------------------------------------------------------------------
// Seção de Regras Léxicas
// Onde a "mágica" acontece. A ordem das regras é MUITO importante.
// -------------------------------------------------------------------------

// Regras para ignorar conteúdo
<YYINITIAL> {
  // Ignora comentários e espaços em branco
  {Comment}      |
  {Whitespace}+  { /* Ação vazia: apenas ignora */ }
}

// Palavras-chave (Keywords)
// **IMPORTANTE**: As regras para palavras-chave devem vir ANTES da regra
// para Identificadores. Senão, "if" seria classificado como um Identificador,
// pois a regra de Identificador também corresponde a "if". O JFlex prioriza
// a regra que aparece primeiro quando duas regras correspondem à mesma string.
<YYINITIAL> {
  "if"        { System.out.println("-> Palavra-Chave: " + yytext()); }
  "else"      { System.out.println("-> Palavra-Chave: " + yytext()); }
  "while"     { System.out.println("-> Palavra-Chave: " + yytext()); }
  "return"    { System.out.println("-> Palavra-Chave: " + yytext()); }
  "int"       { System.out.println("-> Tipo de Dado: " + yytext()); }
}


// Literais e Identificadores
<YYINITIAL> {
  {IntegerLiteral} { System.out.println("-> Literal Inteiro: " + yytext()); }
  {Identifier}     { System.out.println("-> Identificador:  " + yytext()); }
}


// Operadores
<YYINITIAL> {
  "+"   { System.out.println("-> Operador: " + yytext()); }
  "-"   { System.out.println("-> Operador: " + yytext()); }
  "*"   { System.out.println("-> Operador: " + yytext()); }
  "/"   { System.out.println("-> Operador: " + yytext()); }
  "="   { System.out.println("-> Operador de Atribuição: " + yytext()); }
  "=="  { System.out.println("-> Operador de Comparação: " + yytext()); }
  "<"   { System.out.println("-> Operador de Comparação: " + yytext()); }
  ">"   { System.out.println("-> Operador de Comparação: " + yytext()); }
}


// Separadores
<YYINITIAL> {
  "("   { System.out.println("-> Separador (Abre Parênteses): " + yytext()); }
  ")"   { System.out.println("-> Separador (Fecha Parênteses): " + yytext()); }
  "{"   { System.out.println("-> Separador (Abre Chaves): " + yytext()); }
  "}"   { System.out.println("-> Separador (Fecha Chaves): " + yytext()); }
  ";"   { System.out.println("-> Separador (Ponto e Vírgula): " + yytext()); }
}


// Regra "pega-tudo" para caracteres inválidos.
// Deve ser a última regra para capturar qualquer coisa que não foi
// reconhecida pelas regras acima.
. {
    System.err.println(
        "Erro Léxico na Linha " + (yyline + 1) + ", Coluna " + (yycolumn + 1) +
        ". Caractere inesperado: '" + yytext() + "'"
    );
}