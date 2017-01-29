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

REAL = ("-")?[0-9]+("."[0-9]+(e("+"|"-")[0-9]+)?)?
nl = \n|\r|\r\n
ws = [ \t]

%%

","			{ return symbol(sym.CM); }
";"			{ return symbol(sym.S); }
"?"			{ return symbol(sym.END); }
"="			{ return symbol(sym.ASSIGN); }
"("			{ return symbol(sym.RO); }
")"			{ return symbol(sym.RC); }
"["			{ return symbol(sym.SO); }
"]"			{ return symbol(sym.SC); }
"+"			{ return symbol(sym.PLUS); }
"-"			{ return symbol(sym.MINUS); }
"*"			{ return symbol(sym.STAR); }
"/"			{ return symbol(sym.DIV); }
"^"			{ return symbol(sym.POWER); }
"."			{ return symbol(sym.PT); }

{REAL} 		{ return symbol(sym.REAL, new Double(yytext())); }
[a-z] 		{ return symbol(sym.SCALAR, new Character(yycharat(0))); }
[A-Z] 		{ return symbol(sym.VECTOR, new Character(yycharat(0))); }

{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}
