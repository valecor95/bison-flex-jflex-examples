%define api.prefix {Palindrome}
%define api.parser.class {Palindrome}
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
    PalindromeLexer lexer = new PalindromeLexer(System.in);
    Palindrome parser = new Palindrome(lexer);
    if(parser.parse())
      System.out.println("Parsing Result = SUCCESS");
    return;
  }
}

%token UNKNOWN_TOKEN

%%
prog:
  srule
;

srule   
    : 'a' srule 'a' 
    | 'b' srule 'b' 
    | 'a' 'a'       
    | 'b' 'b'       
    | 'a'         
    | 'b'
;
%%

class PalindromeLexer implements Palindrome.Lexer {
  InputStreamReader it;
  Yylex yylex;

  public PalindromeLexer(InputStream is){
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