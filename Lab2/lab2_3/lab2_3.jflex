import java.io.*;

%%

%class Lab2_3
%standalone
%caseless
%unicode

%xstate COMMENT

%{
	FileWriter out;
	int nTags, nTables, nH1, nH2, nH3, nH4;

	private void writeOut(String s) {
		out.write(s);
		out.flush();
	}

	private void writeOut() {
		writeOut(yytext());
	}
%}

%init{
	try {
		out = new FileWriten(new File("output.html"));
		nTags = nTables = nH1 = nH2 = nH3 = nH4 = 0;
	} catch (IOException e) {
		System.err.println(e);
	}
%init}

%eofthrow IOException
%eof{
	nTags = nTags + nTables + nH1 + nH2 + nH3 +nH4;

	System.out.println("Total number of tags: " + nTags);
	System.out.println("Total number of table tags: " + nTables);
	System.out.println("Total number of h1 tags: " + nH1);
	System.out.println("Total number of h1 tags: " + nH2);
	System.out.println("Total number of h1 tags: " + nH3);
	System.out.println("Total number of h1 tags: " + nH4);
%eof}

comm = "<!--"
commc = "-->"

id = [a-zA-Z_][a-zA-Z0-9_]*
tag = <{id}(" "+{attr})*(\>)
tagc = \<\/{id}\>
attr = {id}\=[^ \t\n\r<>]*
text = [^ \t\n\r<>]*

ws = [ \t]+
nl = \n|\r|\r\n

html = ("<html")(" "+{attr})*(">")
head = ("<head")(" "+{attr})*(">")
title = ("<title")(" "+{attr})*(">")
body = ("<body")(" "+{attr})*(">")
h1 = ("<h1")(" "+{attr})*(">")
h2 = ("<h2")(" "+{attr})*(">")
h3 = ("<h3")(" "+{attr})*(">")
h4 = ("<h4")(" "+{attr})*(">")
table = ("<table")(" "+{attr})*(">")

htmlc = ("</html>")
headc = ("</head>")
titlec = ("</title>")
bodyc = ("</body>")
h1c = ("</h1>")
h2c = ("</h2>")
h3c = ("</h3>")
h4c = ("</h4>")
tablec = ("</table>")

%%

{comm} {yybegin(COMMENT);}
<COMMENT> ((\-)+[^>]+)|([^-]+>?)|(->) {System.err.println("COMMENT: " + yytext());}
<COMMENT>{commc} {yybegin(YYINITIAL);}

{html} { nTags++; writeOut(); }
{head} { nTags++; writeOut(); }
{title} { nTags++; writeOut(); }
{body} { nTags++; writeOut(); }
{h1} { nH1++; writeOut(); }
{h2} { nH2++; writeOut(); }
{h3} { nH3++; writeOut(); }
{h4} { nH4++; writeOut(); }
{table} { nTables++; writeOut(); }
{tag} { nTags++; writeOut(); }

{htmlc} { nTags++; writeOut(); }
{headc} { nTags++; writeOut(); }
{titlec} { nTags++; writeOut(); }
{bodyc} { nTags++; writeOut(); }
{h1c} { nH1++; writeOut(); }
{h2c} { nH2++; writeOut(); }
{h3c} { nH3++; writeOut(); }
{h4c} { nH4++; writeOut(); }
{tablec} { nTables++; writeOut(); }
{tagc} { nTags++; writeOut(); }

{text} | {ws} | {nl} {writeOut();}

. {System.out.println("ERROR, character not recognised." + yytext());}
