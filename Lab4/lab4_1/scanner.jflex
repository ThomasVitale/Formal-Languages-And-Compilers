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

comment = "/*" ~ "*/"
VARIABLE = [A-Z_][a-zA-Z0-9_]*
number = ("+"|"-")?[0-9]+("."[0-9]+(e("+"|"-")[0-9]+)?)?
ATOM = ([a-z]|{number})[a-zA-Z0-9_]*
nl = \n|\r|\r\n
ws = [ \t]

%%

"."			{ return symbol(sym.PT); }
","			{ return symbol(sym.CM); }
":-"		{ return symbol(sym.SEP_R); }
"?-"		{ return symbol(sym.SEP_I); }
"("			{ return symbol(sym.RO); }
")"			{ return symbol(sym.RC); }

{ATOM}		{ return symbol(sym.ATOM); }
{VARIABLE}	{ return symbol(sym.VARIABLE); }

{comment}	{;}

{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}
