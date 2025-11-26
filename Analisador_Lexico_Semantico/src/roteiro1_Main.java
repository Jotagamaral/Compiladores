import java.io.*;
import java_cup.runtime.Symbol;

class Main {
    static public void main(String argv[]){
        try {
            Reader reader;
            // Lê do pipe ou do teclado
            reader = new InputStreamReader(System.in);

            // IMPORTANTE: Use o nome da classe definida no .flex
            Roteiro1_Scanner scanner = new Roteiro1_Scanner(reader);
            
            parser p = new parser(scanner);
            
            // Roda o parser
            p.parse(); 

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}