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

INT = ([1-9][0-9]*|0)
DOUBLE = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'\'-')?[0-9]+)?
ID = [A-Za-z_][A-Za-z0-9_]*
comment = "/*" ~ "*/"
nl = \n|\r|\r\n
ws = [ \t]

%%

int			{ return symbol(sym.INT_TYPE); }
double		{ return symbol(sym.DOUBLE_TYPE); }

print		{ return symbol(sym.PRINT); }
if			{ return symbol(sym.IF); }
else		{ return symbol(sym.ELSE); }
while		{ return symbol(sym.WHILE); }

"("			{ return symbol(sym.RO); }
")"			{ return symbol(sym.RC); }
"["			{ return symbol(sym.SO); }
"]"			{ return symbol(sym.SC); }
"{"			{ return symbol(sym.BO); }
"}"			{ return symbol(sym.BC); }

"+"			{ return symbol(sym.PLUS); }
"-"			{ return symbol(sym.MINUS); }
"*"			{ return symbol(sym.STAR); }
"/"			{ return symbol(sym.DIV); }
"="			{ return symbol(sym.ASSIGN); }
;	 		{ return symbol(sym.S); }

"=="		{ return symbol(sym.EQ); }
">="		{ return symbol(sym.GREQ); }
">"			{ return symbol(sym.GR); }
"<="		{ return symbol(sym.SMEQ); }
"<"			{ return symbol(sym.SM); }
"&"			{ return symbol(sym.AND); }
"|"			{ return symbol(sym.OR); }
"!"			{ return symbol(sym.NOT); }
","			{ return symbol(sym.CM); }

{INT} 		{ return symbol(sym.INT, new Integer(yytext())); }
{DOUBLE} 	{ return symbol(sym.DOUBLE, new Double(yytext())); }
{ID} 		{ return symbol(sym.ID, yytext()); }

{comment}	{;}
{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}
