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

ID = [a-zA-Z_][a-zA-Z0-9_]*
INT = ([1-9][0-9]*|0)
WORD = [a-zA-Z]+
comment = "//".*
nl = \n|\r|\r\n
ws = [ \t]

%%

"("			{ return symbol(sym.RO); }
")"			{ return symbol(sym.RC); }
"->"		{ return symbol(sym.ARROW); }
":"			{ return symbol(sym.C); }
","			{ return symbol(sym.CM); }
"."			{ return symbol(sym.PT); }
";"			{ return symbol(sym.S); }
"="			{ return symbol(sym.EQ); }
"+"			{ return symbol(sym.PLUS); }
"-"			{ return symbol(sym.MINUS); }
"*"			{ return symbol(sym.STAR); }
"/"			{ return symbol(sym.DIV); }

{comment} 	{;}

{INT} 		{ return symbol(sym.INT, new Integer(yytext())); }
{WORD} 		{ return symbol(sym.WORD, new String(yytext())); }
{ID} 		{ return symbol(sym.ID, new String(yytext())); }

{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}
