%define api.prefix {BalPar2}
%define api.parser.class {BalPar2}
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
    BalPar2Lexer lexer = new BalPar2Lexer(System.in);
    BalPar2 parser = new BalPar2(lexer);
    if(parser.parse())
      System.out.println("Parsing Result = SUCCESS");
    return;
  }
}

%token L_PAR R_PAR UNKNOWN_TOKEN

%%
/*
Grammatica:
    S -> (S)S | epsilon
*/

prog:
  srule
;

srule: 
    L_PAR srule R_PAR srule
    | 
;
%%

class BalPar2Lexer implements BalPar2.Lexer {
  InputStreamReader it;
  Yylex yylex;

  public BalPar2Lexer(InputStream is){
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