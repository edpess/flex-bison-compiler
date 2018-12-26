%{
  #include "matrix.tab.h"
  #include<stdlib.h>
  #include <stdio.h>
  int  yylex ();
  int line=0;
%}
%option noyywrap


DIGITO [0-9]
NUMERO {DIGITO}+
IGNORA [" "|\t]

%%   
{NUMERO} {yylval.integer=atoi(yytext); return(NUMERO);}
"matrix"  {return (MULT);}
"(" {return (PAA); }
")" {return (PAF); }
"{" {return (CA); }
"}" {return (CF); }
"," {return (VIRG); }
":" {return (TDOTS); }
"end" {return (FINAL);}
"/n" 	{line++;}
" "	{}
[a-zA-Z]+ {return LETTER;}
[\t\r\f\n] {}
. {
	printf("Error lexico in the line %d",line);
}
%%
