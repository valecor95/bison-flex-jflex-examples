%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include "Btree.tab.h"
%}

key     ([0-9])+

%%

{key} {return (KEY);}
"(" { return (L_PAR);}
")" { return (R_PAR);}
. {return *yytext;}

%%