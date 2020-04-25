%%
%standalone
%class G1Lex
%public
%%

<YYINITIAL> {
    "a" {return 'a';}
    "b" {return 'b';}
    . {System.out.println("Token unknown");}
}