import java.io.*;

public class Main {
    static public void main(String[] args) {    
        try {
            /* Scanner instantiation */
            scanner l = new scanner(new FileReader(args[0]));
            /* Parser instantiation */
            parser p = new parser(l);
            /* Run the parser */
            Object result = p.parse();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


