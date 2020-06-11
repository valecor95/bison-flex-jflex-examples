%%
%public
%standalone

%line
%column

L_PAR = "("
R_PAR = ")"
UNKNOWN_TOKEN = .
%%

<YYINITIAL> {
    {L_PAR}     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return BalParLexer.L_PAR;}
    {R_PAR}     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return BalParLexer.R_PAR;}
    {UNKNOWN_TOKEN} {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return BalParLexer.UNKNOWN_TOKEN;}
}