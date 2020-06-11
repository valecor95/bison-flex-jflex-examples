%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include "Palindrome.tab.h"
%}

%%

"a" { printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (A);}
"b" { printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (B);}
.   {return *yytext;}

%%
