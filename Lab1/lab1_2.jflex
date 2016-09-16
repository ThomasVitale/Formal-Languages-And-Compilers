%%

%standalone
%class Lab1_2
%unicode

digit = [0-9]
word = ([^\n\r%/<>:.\\#] | {escape})+
domain = {word}.{word}(.{word})*.{firstlevel}
ipaddress = {octet}\.{octet}\.{octet}\.{octet}
port = ":"{digit}{1,5}
protocol = {word}"://"
octet = {digit}{1,3}
escape = %[0-9A-F]{2}
anchor = #{word}
firstlevel = [a-zA-Z]{2,3}

nl = \n|\r|\r\n
ws = [ \t]

url = {protocol}({ipaddress}|{domain})({port})?"/"(({escape})?{word}"/")*(({word}"."{word})({anchor})?)?

%%

^{url}$ {
	System.out.println("You wrote... wisely! " + yytext());
}

{nl}|{ws} {;}

.+ {
	System.out.println("You wrote... poorly! "+ yytext());
}

