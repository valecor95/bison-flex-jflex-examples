%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include "CNF3.tab.h"
%}

ID  [A-Za-z]+
WS  [ \t\n\r]+

%%

"&&"    { printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (AND);}
"||"    { printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (OR);}
"!"     { printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (NOT);}
"("     { printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (L_PAR);}
")"     { printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (R_PAR);}
{ID}    { printf("[token at line %d: \"%s\"]\n", yylineno, yytext); return (ID);}
{WS}    {}
.       {return *yytext;}

%%