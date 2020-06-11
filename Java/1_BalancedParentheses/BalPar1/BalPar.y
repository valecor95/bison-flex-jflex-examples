%define api.prefix {BalPar}
%define api.parser.class {BalPar}
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
    BalParLexer lexer = new BalParLexer(System.in);
    BalPar parser = new BalPar(lexer);
    if(parser.parse())
      System.out.println("Parsing Result = SUCCESS");
    return;
  }
}

%token L_PAR R_PAR UNKNOWN_TOKEN
%right L_PAR

%%
prog:
  srule
;

srule: 
    L_PAR srule R_PAR
    | srule srule %prec L_PAR
    | L_PAR R_PAR
;
%%

class BalParLexer implements BalPar.Lexer {
  InputStreamReader it;
  Yylex yylex;

  public BalParLexer(InputStream is){
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