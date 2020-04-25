%define api.prefix {G2}
%define api.parser.class {G2}
%define api.parser.public

%code imports{
  import java.io.InputStream;
  import java.io.InputStreamReader;
  import java.io.Reader;
  import java.io.IOException;
}

%code {
  public static void main (String args[]) throws IOException{
    G2Lexer l = new G2Lexer(System.in);
    G2 p = new G2(l);
    p.parse();
  }
}

%%
prog:
  srule
;

srule: 
    '(' srule ')' {System.out.println("( S )\n");}
    | srule srule {System.out.println("SS\n");}
    | '(' ')' {System.out.println("( )\n");}
;
%%

class G2Lexer implements G2.Lexer {

  InputStreamReader it;
  G2Lex gl;

  public G2Lexer(InputStream is)
  {
    it = new InputStreamReader(is);
    gl = new G2Lex(it);
  }

  public void yyerror (String s)
  {
    System.err.println (s);
  }

  Integer yylval;

  public Object getLVal() {
    return yylval;
  }

  public int yylex () throws IOException{
    return gl.yylex();
  }
}