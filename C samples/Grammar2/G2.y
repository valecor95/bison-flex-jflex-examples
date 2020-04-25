%{
#include <stdio.h>

int yylex();
int yyerror(char *s);

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

int yyerror(char *s){
	return 0;
}

int main()
{
    int parse = yyparse();
    if(parse == 0) printf("\nParsing result:  SUCCESS\n\n");
    else if(parse == 1) printf("\nParsing result: Syntax error\n\n");
    else printf("\nParsing result: Memory exhaustion\n\n");
    return 0;
}