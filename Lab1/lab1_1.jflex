%%

%standalone
%class Lab1_1
%unicode

letter = [^0-9\\/:*?\">|(\n|\r|\r\n)-]
digit = [0-9]
id = ({letter}|{digit})+
path = ({letter}:)?(\\)?({id}\\)*{id}(\.{id})?

nl = \n|\r|\r\n
ws = [ \t]

%%

^{path}$ {
	System.out.println("You wrote... wisely! " + yytext());
}

{nl} | {ws} {;}

.+ {
	System.out.println("You wrote... poorly! "+ yytext());
}


