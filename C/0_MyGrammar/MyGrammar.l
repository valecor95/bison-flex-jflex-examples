%option noyywrap
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include "MyGrammar.tab.h"
%}

%%

"a"     {printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (A);}
"b"     {printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (B);}
.       {return *yytext;}

%%