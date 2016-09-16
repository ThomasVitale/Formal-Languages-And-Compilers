import java_cup.runtime.*;

%%

%class Lab2_2
%cup
%unicode

NAME = \"[A-Za-z0-9 .,:]+\"
ISBN = [0-9]{2}-[0-9]{2}-[0-9A-Fa-f]{5}-[A-Za-z0-9]
LETTER = [A-Za-z]
INT = [1-9][0-9]*
DAY = 0[1-9]|[1-2][0-9]|3[0-1]
MONTH = 0[1-9]|1[0-2]
YEAR = [0-9]{4}
DATE = {DAY}\/{MONTH}\/{YEAR}
nl = \n|\r|\r\n
ws = [ \t]

%%

{NAME} {System.out.print("NAME ");
	return new Symbol(sym.NAME);}

-> {System.out.print("ARROW ");
    return new Symbol(sym.ARROW);}

{ISBN} {System.out.print("ISBN ");
	return new Symbol(sym.ISBN);}

: {System.out.print("CL ");
   return new Symbol(sym.CL);}

{INT} {System.out.print("INT ");
       return new Symbol(sym.INT);}

LI {System.out.print("LI ");
    return new Symbol(sym.LI);}

LS {System.out.print("LS ");
    return new Symbol(sym.LS);}

AV {System.out.print("AV ");
    return new Symbol(sym.AV);}

BO {System.out.print("BO ");
    return new Symbol(sym.BO);}

SO {System.out.print("SO ");
    return new Symbol(sym.SO);}

{LETTER} {System.out.print("LETTER ");
          return new Symbol(sym.LETTER);}

, {System.out.print("CM ");
   return new Symbol(sym.CM);}

; {System.out.print("S ");
   return new Symbol(sym.S);}

\%\% {System.out.print("SEP ");
      return new Symbol(sym.SEP);}

{DATE} {System.out.print("DATE ");
        return new Symbol(sym.DATE);}

{ws} | {nl} {;}

. {System.out.print("Scanner error: " + yytext());}

