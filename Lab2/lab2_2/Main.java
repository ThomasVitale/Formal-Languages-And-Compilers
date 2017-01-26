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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
