%define parse.error verbose

%{
#include <stdio.h>

int yylex();
int yyerror(const char *msg);

%}

%token A B

%%

prog:
  srule
;

srule   
    : A srule B
    | A B
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