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


day = 0[1-9] | [1-2][0-9] | 3[0-1]
month = 0[1-9] | 1[0-2]
year = 2[0-9]{3}
hour = 0[0-9] | 1[0-9] | 2[0-3]
minutes = [0-5][0-9]
octet = [0-9] | [1-9][0-9] | 1[0-9][0-9] | 2[0-4][0-9] | 25[0-5]

DATE = {day}\/{month}\/{year}
TIME = {hour}:{minutes}
ID = [a-zA-Z][a-zA-Z0-9_]*
INT = ([1-9][0-9]*|0)
SONG = {ID}"."mp3
IP = {octet}"."{octet}"."{octet}"."{octet}
nl = \n|\r|\r\n
ws = [ \t]

%%

mp3_list:	{ return symbol(sym.SEP1); }
server:		{ return symbol(sym.SEP2); }
Kb\/s		{ return symbol(sym.RATE); }
time:		{ return symbol(sym.TIME_TAG); }
date:		{ return symbol(sym.DATE_TAG); }

":"			{ return symbol(sym.CL); }
";"			{ return symbol(sym.S); }
","			{ return symbol(sym.CM); }

{INT} 		{ return symbol(sym.INT, new Integer(yytext())); }
{SONG}		{ return symbol(sym.SONG, new String(yytext())); }
{DATE}		{ return symbol(sym.DATE, new String(yytext())); }
{TIME}		{ return symbol(sym.TIME, new String(yytext())); }
{IP}		{ return symbol(sym.IP, new String(yytext())); }

{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}
