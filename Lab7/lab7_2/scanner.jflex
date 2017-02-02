import java.io.*;
import java_cup.runtime.*;

%% 

%class Scanner
%cup
%unicode

%line
%column

%{
	private Symbol symbol(int type) {
		return new Symbol(type, yyline, yycolumn);
	}
	private Symbol symbol(int type, Object value) {
		return new Symbol(type, yyline, yycolumn, value);
	}
%}

ID = [A-Za-z_][0-9A-Za-z_]*
INT = ([1-9][0-9]*|0)
TYPE = int | float | double | char
comment = "/*" ~ "*/"
nl = \n|\r|\r\n
ws = [ \t]

%%

"*"			{ return symbol(sym.STAR); }
","			{ return symbol(sym.CM); }
";"			{ return symbol(sym.S); }
"["			{ return symbol(sym.SO); }
"]"			{ return symbol(sym.SC); }

{INT} 		{ return symbol(sym.INT, new Integer(yytext())); }

{TYPE}		{ return symbol(sym.TYPE, new String(yytext()));}

{ID}		{ return symbol(sym.ID, new String(yytext()));}

{comment}	{;}

{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}
