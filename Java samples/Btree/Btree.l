%%
%public
%standalone

%line
%column

KEY = ([0-9])+
UNKNOWN_TOKEN = .
%%

<YYINITIAL> {
    {KEY}   {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return BtreeLexer.KEY;}
    "("     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return '(';}
    ")"     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return ')';}
    {UNKNOWN_TOKEN} {return BtreeLexer.UNKNOWN_TOKEN;}
}