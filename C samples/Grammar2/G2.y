%define parse.error verbose

%{
#include <stdio.h>

int yylex();
int yyerror(const char *msg);

%}

%token L_PAR R_PAR

%%
prog:
  srule
;

srule: 
    L_PAR srule R_PAR {printf("( S )\n");}
    | srule srule {printf("SS\n");}
    | L_PAR R_PAR {printf("( )\n");}
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