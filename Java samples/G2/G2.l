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
    {L_PAR}     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return G2Lexer.L_PAR;}
    {R_PAR}     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return G2Lexer.R_PAR;}
    {UNKNOWN_TOKEN} {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return G2Lexer.UNKNOWN_TOKEN;}
}