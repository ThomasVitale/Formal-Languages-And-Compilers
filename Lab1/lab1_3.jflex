%%

%standalone
%class Lab1_3
%state COMMENT
%unicode

nl = \n|\r|\r\n

const = [0-9]+
string = \" ~ \"
directive = "#"(define|include).*{nl}
keyword = (void|int|long|signed|unsigned|float|double|char|if|else|while|do|switch|case|break|continue|for|return)
id = [A-Za-z_][A-Za-z0-9_]*
op = ("+"|"-"|"/"|"*"|"<"|">"|"=="|">="|"<="|"=")

%%

<YYINITIAL> {

  {const} {
    Htmllib.colPrint(Htmllib.C_LRED); 
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint();
  }

  {string} {
    Htmllib.colPrint(Htmllib.C_RED); 
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint();
  }

  {directive} {
    Htmllib.colPrint(Htmllib.C_LGREEN); 
    Htmllib.textPrint(yytext());
    Htmllib.endtagPrint();
  }

  {keyword} {
    Htmllib.colPrint(Htmllib.C_LBLUE); 
    Htmllib.textPrint(yytext());  
    Htmllib.endtagPrint();
  } 

  {id} {
    Htmllib.colPrint(Htmllib.C_GREEN); 
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint();
  }

  {op} {
    Htmllib.colPrint(Htmllib.C_BLUE); 
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint();
  } 

  "/*" {
    yybegin(COMMENT); 
    Htmllib.colPrint(Htmllib.C_CYAN); 
    Htmllib.textPrint(yytext()); 
  } 
 
  {nl} {
    Htmllib.textPrint(yytext());
  }

  . {
    Htmllib.textPrint(yytext());
  }
  
}  
 
<COMMENT> {

  [^*]* {Htmllib.textPrint(yytext());}

  "*"+[^*/]* {Htmllib.textPrint(yytext());}

  "*"+"/" {
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint(); 
    yybegin(YYINITIAL);
  } 

}
