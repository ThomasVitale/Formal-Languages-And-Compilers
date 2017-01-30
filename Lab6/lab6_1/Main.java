import java.io.*;

public class Main {
	static public void main(String[] args) {

		// Check arguments and set output file
		if (args.length == 1) {
            parser.dumpOutput = "stdout";
        } else if (args.length == 2) {
            parser.dumpOutput = args[1];
        } else {
            System.out.println("Syntax: java Main <in_file> [<out_file>]");
            System.exit(0);
        }
		
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


