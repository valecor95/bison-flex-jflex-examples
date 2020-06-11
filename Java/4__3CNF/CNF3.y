%define api.prefix {CNF3}
%define api.parser.class {CNF3}
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
    CNF3Lexer lexer = new CNF3Lexer(System.in);
    CNF3 parser = new CNF3(lexer);
    if(parser.parse())
      System.out.println("Parsing Result = SUCCESS");
    return;
  }
}

%token AND OR NOT ID UNKNOWN_TOKEN

%%
prog:
  srule
;

srule   
    : srule AND crule
    | crule
;

crule
    :
    | '(' lrule OR lrule OR lrule ')'
;

lrule
    : ID
    | NOT ID
;
%%

class CNF3Lexer implements CNF3.Lexer {
  InputStreamReader it;
  Yylex yylex;

  public CNF3Lexer(InputStream is){
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