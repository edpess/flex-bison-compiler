%{    
  #include <stdio.h>
  #include <stdlib.h>
  #include <math.h>

   void yyerror(char*msg);
   void multMatrix(int matriz1[2][2],int matriz2[2][2]);
   
   extern char *yytext;
   extern int line;
   extern FILE *yyin;
   extern int yylex(void);
   int matriz1[2][2]; 
   int matriz2[2][2];
    
%}
%union
{
  int integer;
}
%token <integer> NUMERO
%token MULT 
%token PAA
%token PAF 
%token CA 
%token CF 
%token VIRG 
%token TDOTS
%token FINAL
%token LETTER

%type <integer> A
%type <integer> B
%type <integer> C
%type <integer> D
%type <integer> E
%type <integer> F
%type <integer> G
%type <integer> H

%%
Statement: EXPRESSION;
EXPRESSION: MULT PAA MATRIX TDOTS MATRIZ  PAF FINALIZE;

FINALIZE : FINAL{
	multMatrix(matriz1, matriz2);
} | LETTER {
		printf("\nInvalid Sentence ");
	}
MATRIX: VET1  VET2;
VET1 : CA E VIRG F CF;
VET2 : CA G VIRG H CF;
E:NUMERO{ matriz1[0][0]= $1;}; 
F:NUMERO{ matriz1[0][1]= $1;};
G:NUMERO{ matriz1[1][0]= $1;};
H:NUMERO{ matriz1[1][1]= $1;};

MATRIZ:VET3 VET4;  
VET3 : CA A VIRG B CF;
VET4 : CA C VIRG D CF; 
A:NUMERO{ matriz2[0][0]= $1;}; 
B:NUMERO{ matriz2[0][1]= $1;};
C:NUMERO{ matriz2[1][0]= $1;};
D:NUMERO{ matriz2[1][1]= $1;};

%%
void yyerror(char *s){
  printf("\nThat sentense is invalid: %s",s);
  
}
int main(int argc,char **argv){
  
  printf("\n\t The input format is: matrix({1,2}{3,4}:{5,6}{7,8})end\n\n");
  
  if (argc>1)
	yyin=fopen(argv[1],"rt");
  else
	yyin=stdin;

  yyparse();
  return 0;
 
}
void multMatrix(int matriz1[2][2],int matriz2[2][2]){

	int f=0, g=0;
	printf("\n\n\t:: Product ::\n\n");
	while(f<2){
		g=0;
		while(g<2){
			printf("\t  %d",matriz1[f][g]);
			g++;
		}
		f++;
		printf("\n");
	}
	printf("\t  ----------\n");
	f=0; g=0;
	
	
	while(f<2){
		g=0;
		while(g<2){
			printf("\t  %d",matriz2[f][g]);
			g++;
		}
		f++;
		printf("\n");
	}
	printf("\t  ----------\n\n\n");
	
	f=0; g=0;
	while(f<2){
		g=0;
		while(g<2){
			printf("\t  %d",matriz1[f][g]*matriz2[f][g]);
			g++;
		}
		printf("\n");
		f++;
     }

         printf("\n\n\t Use sh clean.sh to clean\n");
         printf("\n\t To exit press ctrl+c\n\n");
}
