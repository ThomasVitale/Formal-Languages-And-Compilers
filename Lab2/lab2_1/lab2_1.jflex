import java_cup.runtime.*;

%%

%standalone
%class Lab2_1
%unicode

id = [A-Za-z_][A-Za-z0-9_]*
integer = ([1-9][0-9]*|0)
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'\'-')?[0-9]+)?
ws = [ \t]
nl = \n|\r|\r\n

%%

"{" {System.out.print("BO ");}
"}" {System.out.print("BC ");}
"(" {System.out.print("RO ");}
")" {System.out.print("RC ");}
"[" {System.out.print("SO ");}
"]" {System.out.print("SC ");}
"+" {System.out.print("PLUS ");}
"-" {System.out.print("MINUS ");}
"*" {System.out.print("STAR ");}
"/" {System.out.print("DIV ");}
"=" {System.out.print("EQ ");}
";" {System.out.print("S ");}
"." {System.out.print("P ");}
"," {System.out.print("C ");}
"<" {System.out.print("MIN ");}
">" {System.out.print("MAJ ");}
"&" {System.out.print("AND ");}
"|" {System.out.print("OR ");}
"!" {System.out.print("NOT ");}

"int" {System.out.print("INT_TYPE ");}
"double" {System.out.print("DOUBLE_TYPE ");}
if {System.out.print("IF ");}
else {System.out.print("ELSE ");}
while {System.out.print("WHILE ");}
print {System.out.print("PRINT ");}

{integer} {System.out.print("INT:"+yytext()+" ");}
{double} {System.out.print("DOUBLE:"+yytext()+" ");}
{id} {System.out.print("ID:"+yytext()+" ");}

"/*" ~ "*/" {;}
{ws} | {nl} {;}

. {System.out.println("SCANNER ERROR: " + yytext());}
