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
    {L_PAR}     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return BalPar2Lexer.L_PAR;}
    {R_PAR}     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return BalPar2Lexer.R_PAR;}
    {UNKNOWN_TOKEN} {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return BalPar2Lexer.UNKNOWN_TOKEN;}
}