%option noyywrap
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include "Btree.tab.h"
%}

key     ([0-9])+

%%

{key}   {printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (KEY);}
"("     {printf("[token at line %d: \"(\"]\n", yylineno); return '(';}
")"     {printf("[token at line %d: \")\"]\n", yylineno); return ')';}
.       {return *yytext;}

%%