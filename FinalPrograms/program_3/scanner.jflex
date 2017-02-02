import java_cup.runtime.*;
import java.io.*;

%%

%class scanner
%unicode
%cup
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

nl = \r|\n|\r\n
ws = [ \t]
integer = (("-")?[0-9])|([1-5][0-9])|(6[0-7])|("-"[1-9][0-9])|("-"1[0-7][0-9])|("-"18[0-3])
float = ([0-9]*\.[0-9]*) 
word = [A-Z]{4}([A-Z]{2})*
comb = (([xy]{2})){4}(([xy]{2}))*
token = {integer}({word})?("***"|{comb})";"
date_format = {year}\/{month}\/{day}
day = 0[1-9]|[1-2][0-9]|3[0-1]
month = 10 | 12 | 01 
year = 2015 | 2016
time = {hour}":"{minutes}
hour = 07|08|09|10|11|12|13|14
minutes = [0-5][0-9]
date = ((2015\/09\/(19|2[0-9]|30)) 
	   | (2015\/11\/(0[1-9]|[1-2][0-9]|30)) 
	   | (2016\/02\/(0[1-9]|1[0-5]))
	   | {date_format}) 
	   (":"(((06":"(1[3-9]|[2-5][0-9])) | (15":"([0-3][0-9]|4[0-3]))) | {time}))?";"
sep = ("%"{4})("%"{2})*

%%

{nl} | {ws} {;}

{comment} {;}

{token} { return symbol(sym.TOKEN); }
{date} { return symbol(sym.DATE); }

{sep} { return symbol(sym.SEP); }

SET { return symbol(sym.SET); }
POWER {return symbol(sym.POWER); }
WATER {return symbol(sym.WATER); }
{float} {return symbol(sym.FLOAT, new Double(yytext()));}

"STATE_CHANGE1" { return symbol(sym.CHANGE1); }
INCREASE { return symbol(sym.INC); }
DECREASE { return symbol(sym.DEC); }
TRUE { return symbol(sym.TRUE); }
FALSE { return symbol(sym.FALSE); }
AND { return symbol(sym.AND); }
OR { return symbol(sym.OR); }
NOT { return symbol(sym.NOT); }
AVG { return symbol(sym.AVG); }

"STATE_CHANGE2" { return symbol(sym.CHANGE2); }
PRESSURE { return symbol(sym.PRESS); }
TEMP { return symbol(sym.TEMP); }
ADD { return symbol(sym.ADD); }
SUB { return symbol(sym.SUB); }

"-" {return symbol(sym.DASH); }
";" {return symbol(sym.SC); }
"(" {return symbol(sym.RO); }
")" {return symbol(sym.RC); }
"?" {return symbol(sym.QM); }
"," {return symbol(sym.CM); }
":" {return symbol(sym.C); }
"#" {return symbol(sym.TAG); }
"->" {return symbol(sym.ARROW); }

. {System.out.println("SCANNER ERROR: " +yytext() );}
