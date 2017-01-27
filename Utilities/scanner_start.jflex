import java.io.*
import java_cup.runtime.*

%% 

%{ Java code %}
%init{  %init}
%eof{ %eof}

%class Scanner
%cup
%unicode

%caseless

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

%char

%state MYSTATE
%xstate MYEXSTATE

INT = ([1-9][0-9]*|0)
nl = \n|\r|\r\n
ws = [ \t]

%%

{INT} 		{ return new Symbol(sym.INT); }

{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}
