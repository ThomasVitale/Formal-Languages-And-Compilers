import java.io.*;

public class Main {

	public static void main(String[] args) {
		try {
			/* Scanner instantiation */
			Scanner s = new Scanner(new FileReader(args[0]));
			/* Parser instantiation */
			parser p = new parser(s);
			/* Start the parser */
			Object result = p.parse(); 
			// Object result = p.debug_parse();     
		} catch (NullPointerException e){
        	System.err.println("Syntax error");
      	} catch (FileNotFoundException e){
        	System.err.println("Error opening file " + args[0]);
      	} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
