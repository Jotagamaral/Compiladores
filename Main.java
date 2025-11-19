// Main.java (Corrigido para usar Reader e tratar a codificação)

import java.io.*;
import java_cup.runtime.Symbol; // Importante para o resultado, caso você o use
// Você pode precisar de import java.nio.charset.Charset; para definir o charset
// Ou use uma abordagem mais simples:

class Main {
    static public void main(String argv[]){
        try {
            // Cria um Reader a partir do System.in
            java.io.Reader reader = new InputStreamReader(System.in); 
            
            // 1. Instancia o Scanner (Léxico)
            Scanner scanner = new Scanner(reader);
            
            // 2. Instancia o Parser (Sintático)
            parser p = new parser(scanner);
            
            // 3. Roda o Parser
            // p.parse() retorna um objeto Symbol que contém o valor no campo .value
            Object result = p.parse().value; 
            
            System.out.println("Análise concluída com sucesso. Resultado: " + result);

        } catch (Exception e) {
            System.err.println("Erro na análise:");
            e.printStackTrace();
        }
    }
}