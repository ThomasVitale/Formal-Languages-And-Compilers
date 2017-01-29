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

int			{ return new Symbol(sym.INT_TYPE); }
double		{ return new Symbol(sym.DOUBLE_TYPE); }

print		{ return new Symbol(sym.PRINT); }
if			{ return new Symbol(sym.IF); }
else		{ return new Symbol(sym.ELSE); }
while		{ return new Symbol(sym.WHILE); }

"("			{ return new Symbol(sym.RO); }
")"			{ return new Symbol(sym.RC); }
"["			{ return new Symbol(sym.SO); }
"]"			{ return new Symbol(sym.SC); }
"{"			{ return new Symbol(sym.BO); }
"}"			{ return new Symbol(sym.BC); }

"+"			{ return new Symbol(sym.PLUS); }
"-"			{ return new Symbol(sym.MINUS); }
"*"			{ return new Symbol(sym.STAR); }
"/"			{ return new Symbol(sym.DIV); }
"="			{ return new Symbol(sym.ASSIGN); }
;	 		{ return new Symbol(sym.S); }

"=="		{ return new Symbol(sym.EQ); }
">="		{ return new Symbol(sym.GREQ); }
">"			{ return new Symbol(sym.GR); }
"<="		{ return new Symbol(sym.SMEQ); }
"<"			{ return new Symbol(sym.SM); }
"&"			{ return new Symbol(sym.AND); }
"|"			{ return new Symbol(sym.OR); }
"!"			{ return new Symbol(sym.NOT); }
","			{ return new Symbol(sym.CM); }

{INT} 		{ return new Symbol(sym.INT, new Integer(yytext())); }
{DOUBLE} 	{ return new Symbol(sym.DOUBLE, new Double(yytext())); }
{ID} 		{ return new Symbol(sym.ID, yytext()); }

{comment}	{;}
{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}
