%{
#include <stdio.h>
#include <string.h>
#include "G2.tab.h"
%}

%%

"(" { return (L_PAR);}
")" { return (R_PAR);}

%%