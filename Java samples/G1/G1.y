%define api.prefix {G1}
%define api.parser.class {G1}
%define api.parser.public

%code imports{
  import java.io.InputStream;
  import java.io.InputStreamReader;
  import java.io.Reader;
  import java.io.IOException;
}

%code {
  public static void main (String args[]) throws IOException{
    G1Lexer l = new G1Lexer(System.in);
    G1 p = new G1(l);
    p.parse();
  }
}

%%
prog:
  srule
;

srule   
    : 'a' srule 'a' {System.out.println("a S a");}
    | 'b' srule 'b' {System.out.println("b S b");}
    | 'a' 'a'       {System.out.println("aa");}
    | 'b' 'b'       {System.out.println("bb");}
    | 'a'         {System.out.println("a");}
    | 'b'         {System.out.println("b");}
;
%%

class G1Lexer implements G1.Lexer {

  InputStreamReader it;
  G1Lex gl;

  public G1Lexer(InputStream is)
  {
    it = new InputStreamReader(is);
    gl = new G1Lex(it);
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