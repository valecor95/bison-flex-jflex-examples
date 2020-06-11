%option noyywrap
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include "BalPar2.tab.h"             
%}

%%

"("     {printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (L_PAR);}
")"     {printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (R_PAR);}
.       {return *yytext;}

%%
