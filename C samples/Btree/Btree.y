%define parse.error verbose

%{
#include <stdio.h>

int yylex();
int yyerror(const char *msg);

%}

%token KEY L_PAR R_PAR

%%

prog:
  srule
;

srule   
    : L_PAR R_PAR {printf("()\n");}
    | L_PAR KEY srule srule R_PAR {printf("(key S S)\n");}
;

%%

int yyerror(const char *msg){
	fprintf(stderr, "%s\n", msg);
  return 0;
}

int main()
{
    int parse = yyparse();
    if(parse == 0) printf("\nParsing result:  SUCCESS\n\n");
    return 0;
}