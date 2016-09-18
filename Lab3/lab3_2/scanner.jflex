/**/import java_cup.runtime.*;

%%

%class scanner
%line
%column
%unicode
%cup

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
	
  }
%}

nl = \r|\n|\r\n
ws = [ \t]

sign_modifier = signed | unsigned
type = int | long | short | float | double | char
length_modifier = long | short
storage = extern | register | auto | static
void = void

const = [0-9]+
floating = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
directive = "#"(include|define).*\n
string = \"([^\n\r\"]+|\\\")*\"
id = [A-Za-z_][A-Za-z0-9_]*
relop = ("=="|">="|"<="|"<"|">"|"!=")
logop = ("||"|"&&")
assop = ("+="|"-="|"*="|"/=")

%%

{ws}|{nl} {;}

{directive} {;}

"/*" ~ "*/"     {;}

if {return symbol(sym.IF);}
else {return symbol(sym.ELSE);}
do {return symbol(sym.DO);}
while {return symbol(sym.WHILE);}
switch {return symbol(sym.SWITCH);}
case {return symbol(sym.CASE);}
break {return symbol(sym.BREAK);}
default {return symbol(sym.DEFAULT);}
for {return symbol(sym.FOR);}
return {return symbol(sym.RETURN);}

"++" {return symbol(sym.INCR);}
"--" {return symbol(sym.DECR);}

{assop} {return symbol(sym.ASSOP);}
{relop} {return symbol(sym.RELOP);}
{logop} {return symbol(sym.LOGOP);}

"(" {return symbol(sym.RO);}
")" {return symbol(sym.RC);}
"[" {return symbol(sym.SO);}
"]" {return symbol(sym.SC);}
"{" {return symbol(sym.BO);}
"}" {return symbol(sym.BC);}

"=" {return symbol(sym.EQ);}
"+" {return symbol(sym.PLUS);}
"-" {return symbol(sym.MINUS);}
"*" {return symbol(sym.STAR);}
"/" {return symbol(sym.DIV);}
"%" {return symbol(sym.MOD);}

":" {return symbol(sym.C);}
";" {return symbol(sym.S);}
"," {return symbol(sym.CM);}

{sign_modifier} {return symbol(sym.SIGN_MODIFIER);}
{length_modifier} {return symbol(sym.LENGTH_MODIFIER);}
{storage} {return symbol(sym.STORAGE);}
{type} {return symbol(sym.TYPE);}
{void} {return symbol(sym.VOID);}
{string} {return symbol(sym.STRING);}
{const}|{floating} {return symbol(sym.CONST);}
{id} {return symbol(sym.ID);}

. {System.out.println("SCANNER ERROR: "+yytext());}
