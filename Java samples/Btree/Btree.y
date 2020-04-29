%define api.prefix {Btree}
%define api.parser.class {Btree}
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
    BtreeLexer lexer = new BtreeLexer(System.in);
    Btree parser = new Btree(lexer);
    if(parser.parse())
      System.out.println("Parsing Result = SUCCESS");
    return;
  }
}

%token KEY UNKNOWN_TOKEN 

%%
prog:
  srule
;

srule: 
    '(' ')'
    | '(' KEY srule srule ')'
;
%%

class BtreeLexer implements Btree.Lexer {
  InputStreamReader it;
  Yylex yylex;

  public BtreeLexer(InputStream is){
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