import java.io.*;
import java_cup.runtime.*;

%% 

%class Scanner
%cup
%unicode

day = 0[1-9] | [1-2][0-9] | 3[0-1]
month = 0[1-9] | 1[0-2]
year = [0-9]{4}

DATE = {day}\/{month}\/{year}
INT = [1-9][0-9]*
ISBN = [0-9]{2}-[0-9]{2}-[0-9A-Fa-f]{5}-[a-zA-Z0-9]
LETTER = [a-zA-Z]
NAME = \"[a-zA-Z0-9 .,:]+\"

nl = \n|\r|\r\n
ws = [ \t]

%%

->			{return new Symbol(sym.ARROW);}
: 			{return new Symbol(sym.CL);}
, 			{return new Symbol(sym.CM);}
; 			{return new Symbol(sym.S);}
\%\%		{return new Symbol(sym.SEP);}

{DATE} 		{return new Symbol(sym.DATE);}
{INT} 		{return new Symbol(sym.INT);}
{ISBN} 		{return new Symbol(sym.ISBN);}
{LETTER}	{return new Symbol(sym.LETTER);}
{NAME}		{return new Symbol(sym.NAME);}


AV			{return new Symbol(sym.AV);}
BO			{return new Symbol(sym.BO);}
LI			{return new Symbol(sym.LI);}
LS			{return new Symbol(sym.LS);}
SO			{return new Symbol(sym.SO);}

{ws} | {nl} {;}

. 			{System.out.print("Scanner error: " + yytext());}

