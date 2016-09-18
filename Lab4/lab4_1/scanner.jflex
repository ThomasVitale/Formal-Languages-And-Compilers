import java_cup.runtime.*;

%%

%class scanner
%unicode
%cup
%line
%column
%state COMMENT

%{
	private Symbol symbol(int type) {
		return new Symbol(type, yyline, yycolumn);
	}
%}

nl = \n|\r|\r\n
ws = [ \t]+
number = ("+"|"-")?[0-9]+("."[0-9]+(e("+"|"-")[0-9]+)?)?
atom = [a-z][a-zA-Z0-9_]*
variable = [A-Z_][a-zA-Z0-9_]*

%%

{nl} | {ws} {;}

"(" {return symbol(sym.RO);}
")" {return symbol(sym.RC);}
"|" {return symbol(sym.PIPE);}
"." {return symbol(sym.PT);}
"," {return symbol(sym.CM);}
":-" {return symbol(sym.SEP1);}
"?-" {return symbol(sym.SEP2);}
{number} {return symbol(sym.ATOM);}
{atom} {return symbol(sym.ATOM);}
{variable} {return symbol(sym.VARIABLE);}

"/*" {yybegin(COMMENT);}
<COMMENT>{
	[^*]* {;}
	"*"+[^*/]* {;}
	"*"+"/" {yybegin(YYINITIAL);}
}


