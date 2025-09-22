%%

%standalone

Letra = [a-zA-Z]
Digito = [0-9]
Palavra = {Letra}+
Numero = {Digito}+
AlfaNum = ({Letra}+{Digito}+|{Digito}+{Letra}+)

%%

{Numero}    {System.out.println("> Apenas número");}
{Palavra}   {System.out.println("> Apenas palavra");}
{AlfaNum}   {System.out.println("> Alfanumérico misto");}
