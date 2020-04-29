%define api.prefix {G2}
%define api.parser.class {G2}
%define api.parser.public
%define parse.error verbose

%code imports{
  import java.io.InputStream;
  import java.io.InputStreamReader;
  import java.io.Reader;
  import java.io.IOException;
}

%code {
  public static void main(String args[]) throws IOException {
    G2Lexer lexer = new G2Lexer(System.in);
    G2 parser = new G2(lexer);
    if(parser.parse())
      System.out.println("Parsing Result = SUCCESS");
    return;
  }
}

%token L_PAR R_PAR UNKNOWN_TOKEN

%%
prog:
  srule
;

srule: 
    L_PAR srule R_PAR
    | srule srule 
    | L_PAR R_PAR
;
%%

class G2Lexer implements G2.Lexer {
  InputStreamReader it;
  Yylex yylex;

  public G2Lexer(InputStream is){
    it = new InputStreamReader(is);
    yylex = new Yylex(it);
  }

  @Override
  public void yyerror (String s){
    System.err.println(s);
  }

  @Override
  public Object getLVal() {
    return null;
  }

  @Override
  public int yylex () throws IOException{
    return yylex.yylex();
  }
}