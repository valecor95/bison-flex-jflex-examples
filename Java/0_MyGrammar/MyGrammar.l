%%
%public
%standalone

%line
%column

UNKNOWN_TOKEN = .
%%

<YYINITIAL> {
    "a"     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return 'a';}
    "b"     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return 'b';}
    {UNKNOWN_TOKEN} {return MyGrammarLexer.UNKNOWN_TOKEN;}
}