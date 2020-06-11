%define parse.error verbose

%{
#include <stdio.h>

int yylex();
int yyerror(const char *msg);

%}

%token AND OR NOT L_PAR R_PAR ID

%%

prog:
  srule
;

srule   
    : srule AND crule
    | crule
;

crule
    :
    | L_PAR lrule OR lrule OR lrule R_PAR
;

lrule
    : ID
    | NOT ID
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