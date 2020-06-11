%%
%public
%standalone

%line
%column

ID = [A-Za-z]+
WS = [ \t\n\r]+
UNKNOWN_TOKEN = .
%%

<YYINITIAL> {
    "&&"    {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return CNF3Lexer.AND;}
    "||"    {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return CNF3Lexer.OR;}
    "!"     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return CNF3Lexer.NOT;}
    ")"     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return ')';}
    "("     {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return '(';}
    {ID}    {System.out.println("[token at line " + yyline + ":" + yycolumn + " = \"" + yytext() + "\"]"); return CNF3Lexer.ID;}
    {WS}    {}
    {UNKNOWN_TOKEN} {return CNF3Lexer.UNKNOWN_TOKEN;}
}