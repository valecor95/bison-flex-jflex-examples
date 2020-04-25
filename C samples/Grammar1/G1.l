%{
#include <stdio.h>
#include <string.h>
#include "G1.tab.h"
%}

%%

"a" { return (A);}
"b" { return (B);}

%%