import java_cup.runtime.*;

%%

%class scanner
%line
%column
%cup
%unicode

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
	
  }
%}

nl = \n|\r|\r\n
ws = [ \t]

constant = ("-")?[0-9]+("."[0-9]+((e|E)("+"|"-")?[0-9]+)?)?
scalar = [a-z]
vector = [A-Z]

%%

"+" {return symbol(sym.PLUS);}
"-" {return symbol(sym.MINUS);}
"*" {return symbol(sym.STAR);}
"/" {return symbol(sym.DIV);}
"=" {return symbol(sym.EQ);}
"(" {return symbol(sym.RO);}
")" {return symbol(sym.RC);}
"[" {return symbol(sym.SO);}
"]" {return symbol(sym.SC);}
";" {return symbol(sym.SC);}
"." {return symbol(sym.PT);}
"," {return symbol(sym.CM);}
"^" {return symbol(sym.EXP);}
"?" {return symbol(sym.QM);}

{constant} { return symbol(sym.CONST, new Double(yytext())); }
{scalar} { return symbol(sym.SCALAR, new Character(yycharat(0))); }
{vector} { return symbol(sym.VECTOR, new Character(yycharat(0))); }

{nl} | {ws} {;}




