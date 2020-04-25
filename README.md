# Bison
Bison is a general-purpose parser generator that converts an annotated context-free grammar into a deterministic LR or generalized LR (GLR) parser employing LALR(1), IELR(1) or canonical LR(1) parser tables.
In these examples we will work with Flex lexer for C target, and JFlex lexer for Java.

**Bison Official Documentation**: https://www.gnu.org/software/bison/manual/bison.html

---
## Setup

#### Linux
* Install Flex with APT:
```
sudo apt install flex
```

* Install JFlex with APT
```
sudo apt install jflex
```

* Install Bison with APT
```
sudo apt install bison
```
#### macOS
ATTENTION: the os must be updated

* Install Flex with Homebrew:
```
brew install flex
```

* Install JFlex with Homebrew
```
brew install jflex
```

* Install Bison with Homebrew
```
brew install bison
```
Could be necessary: `brew link bison --force`

---
## C

#### Flex files - ".l"
Structure:
1. C declarations (include library and function declaration)
2. Flex declarations (espressioni regolari)
3. Token definition
4. Additional C code (function definitions, main)
```
%{
    C declarations
%}

Flex declarations

%%
    Tokens definition
%%

Additional C code
```

Flex Official Documentation: ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html
#### Bison files - ".y"
Structure:
1. C declarations (include library and function declaration)
2. Bison declarations (token definition)
3. Grammar rules
4. Additional C code (function definitions, main)
```
%{
    C declarations
%}

Bison declarations

%%
    Grammar rules
%%

Additional C code
```

#### Compilation and Execution

1. Compile the `example.l` file using flex:
```
flex -l example.l
```
This generates the file: `lex.yy.c`

2. Compile the `example.y` file using bison: 
```
bison -d example.y
```
This generates two files: `example.tab.h` `example.tab.c.`

3. Compile example.tab.c using
```
gcc -o example example.tab.c lex.yy.c -lfl
```

4. Test the executable using
```
./example < “inpute-file”
```
The "example" executable call *lex.yy.c* for the tokens and make a tree.

---
## Java
#### JFlex files - ".l"
Structure:
1. Imports and packages(library import)
2. Options and declarations (see documentation, there are a lot of options)
3. Lexical rules
```
<UserCode>

%%

<Options and declarations>

%%

<Lexical rules>
```

**JFlex Official Documentation**: https://jflex.de/manual.html

#### Bison files - ".y"
Structure:
1. Definitions (public, class, prefix, etc...)
2. Imports (library import)
3. Main Java code
4. Grammar rules
5. Additional Java code (function definitions)
```
%define <Definitions>

%code imports{
  <Library to import>
}

%code {
  public static void main (String args[]) throws IOException{
    <main code>
  }
}

%%

<Grammar rules>

%%

<Additional Java code>
```

#### Compilation and Execution
1. Compile the `example.l` file using flex:
```
jflex example.l
```
This generates the file: `Yylex.java` (you can change the name if *%define api.prefix {name-you-want}* is setted)

2. Compile the `example.y` file using bison: 
```
bison example.y -L java
```
This generate: `Example.java`

3. Compile all using:
```
javac *.java
```

4. Test the executable using
```
java Example < input-file
```
---
### Useful links
* [Bison GNU whole project](https://www.gnu.org/software/bison/)

* [Documentation - Bison Java parser](https://www.gnu.org/software/bison/manual/html_node/Java-Parsers.html)

* [StackOverflow - "bison" tag](https://stackoverflow.com/questions/tagged/bison)

* [VIDEO - Tutorial: programming with lex/yacc](https://www.youtube.com/playlist?list=PLkB3phqR3X43IRqPT0t1iBfmT5bvn198Z)

* [VIDEO - Flex/Bison Tutorial](https://www.youtube.com/playlist?list=PLYwB_l2-dW_TDMsd2Us_V8yaJlCzDOtlU)

* [VIDEO - Getting started with JFlex](https://www.youtube.com/watch?v=IV1Rwq7ERR4&list=RDCMUC6-g6xhqyX14ENhZBC2fznw&start_radio=1&t=621)