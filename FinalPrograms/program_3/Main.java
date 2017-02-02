import java.io.*;

public class Main {
    static public void main(String[] args) {    
        try {
            scanner l = new scanner(new FileReader(args[0]));
            parser p = new parser(l);
            Object result = p.parse();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


