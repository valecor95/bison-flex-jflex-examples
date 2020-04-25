%{
#include <stdio.h>

int yylex();
int yyerror(char *s);

%}

%token A B 

%%

prog:
  srule
;

srule   
    : A srule A {printf("a S a\n");}
    | B srule B {printf("b S b\n");}
    | A A       {printf("aa\n");}
    | B B       {printf("bb\n");}
    | A         {printf("a\n");}
    | B         {printf("b\n");}
;

%%

int yyerror(char *s){
  printf("\nParsing result:  %s\n\n", s);
	return 0;
}

int main()
{
    int parse = yyparse();
    if(parse == 0) printf("\nParsing result:  SUCCESS\n\n");
    return 0;
}