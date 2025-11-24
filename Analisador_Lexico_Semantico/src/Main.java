import java.io.*;
import java_cup.runtime.Symbol;

class Main {
    static public void main(String argv[]){
        try {
            // Se passar argumento, lê do arquivo, senão lê do console (System.in)
            Reader reader;
            if (argv.length > 0) {
                 reader = new FileReader(argv[0]);
            } else {
                 reader = new InputStreamReader(System.in);
            }

            // CORREÇÃO AQUI: Mudamos de 'Scanner' para 'Analisador'
            // O nome da classe deve bater com o %class do seu arquivo .flex
            Analisador scanner = new Analisador(reader);
            
            parser p = new parser(scanner);
            
            // Roda o parser
            Object result = p.parse().value; 
            
            // System.out.println("Resultado: " + result);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}