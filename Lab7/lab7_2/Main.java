import java.io.*;

public class Main {
	static public void main(String[] args) {
		
		// Run scanner and parser
		try {
			/* Scanner instantiation */
			Scanner l = new Scanner(new FileReader(args[0]));
			/* Parser instantiation */
			parser p = new parser(l);
			/* Run the parser */
			Object result = p.parse();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


