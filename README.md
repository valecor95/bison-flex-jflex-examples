# Bison
Bison is a general-purpose parser generator that converts an annotated context-free grammar into a deterministic LR or generalized LR (GLR) parser employing LALR(1), IELR(1) or canonical LR(1) parser tables.
In these examples we will work with Flex lexer for C target, and JFlex lexer for Java.

**Bison Official Documentation**: https://www.gnu.org/software/bison/manual/bison.html

---
## Setup

### Linux
* Install Flex, JFlex and Bison with APT:
```bash
sudo apt install flex
sudo apt install jflex
sudo apt install bison
```
### macOS
ATTENTION: the os must be updated

* Install Flex, JFlex and Bison with Homebrew:
```bash
brew install flex
brew install jflex
brew install bison
```
Could be necessary: `brew link bison --force`

**NOTE:** If the previous two alternatives goes wrong, download the mirror from [here](http://mirror.lihnidos.org/GNU/ftp/gnu/bison/) and follow this guide to install: [Installation from scratch](http://www.linuxfromscratch.org/lfs/view/development/chapter06/bison.html)

---
## C

### Flex files - ".l"
Structure:
1. C declarations (include library and function declaration)
2. Flex declarations (espressioni regolari)
3. Token definition
4. Additional C code (function definitions, main)
```bison
%{
    C declarations
%}

Flex declarations

%%
    Tokens definition
%%

Additional C code
```

Flex Official Documentation: https://github.com/westes/flex
### Bison files - ".y"
Structure:
1. C declarations (include library and function declaration)
2. Bison declarations (token definition)
3. Grammar rules
4. Additional C code (function definitions, main)
```bison
%{
    C declarations
%}

Bison declarations

%%
    Grammar rules
%%

Additional C code
```

### Compilation and Execution

1. Compile the `example.l` file using flex:
```bash
flex -l example.l
```
This generates the file: `lex.yy.c`

2. Compile the `example.y` file using bison: 
```bash
bison -d example.y
```
This generates two files: `example.tab.h` `example.tab.c.`

3. Compile example.tab.c using
```bash
gcc -o example example.tab.c lex.yy.c -lm
```

4. Test the executable using
```bash
./example < “inpute-file”
```
The "example" executable call *lex.yy.c* for the tokens and make a tree.

---
## Java
Bison 3.5 is needed:
* Download: [mirror Bison 3.5](http://mirror.lihnidos.org/GNU/ftp/gnu/bison/)
* Installation: [Install Bison 3.5](http://www.linuxfromscratch.org/lfs/view/development/chapter06/bison.html)
### JFlex files - ".l"
Structure:
1. Imports and packages(library import)
2. Options and declarations (see documentation, there are a lot of options)
3. Lexical rules
```bison
<UserCode>

%%

<Options and declarations>

%%

<Lexical rules>
```

**JFlex Official Documentation**: https://jflex.de/manual.html

### Bison files - ".y"
Structure:
1. Definitions (public, class, prefix, etc...)
2. Imports (library import)
3. Main Java code
4. Grammar rules
5. Additional Java code (function definitions)
```bison
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

### Compilation and Execution
1. Compile the `example.l` file using flex:
```bash
jflex example.l
```
This generates the file: `Yylex.java` (you can change the name if *%define api.prefix {name-you-want}* is setted)

2. Compile the `example.y` file using bison: 
```bash
bison example.y -L java
```
This generate: `Example.java`

3. Compile all using:
```bash
javac *.java
```

4. Test the executable using
```bash
java Example < input-file
```
---
## Useful links
* [Bison GNU whole project](https://www.gnu.org/software/bison/)
* [Bison Official Documentation](https://www.gnu.org/software/bison/manual/bison.html)
* [Flex Documentation](https://github.com/westes/flex)
* [JFlex Documentation](https://jflex.de/manual.html)
* [Bison Java - Documentation](https://www.gnu.org/software/bison/manual/html_node/Java-Parsers.html)
* [StackOverflow - "bison" tag](https://stackoverflow.com/questions/tagged/bison)
* [VIDEO - Tutorial: programming with lex/yacc](https://www.youtube.com/playlist?list=PLkB3phqR3X43IRqPT0t1iBfmT5bvn198Z)
* [VIDEO - Flex/Bison Tutorial](https://www.youtube.com/playlist?list=PLYwB_l2-dW_TDMsd2Us_V8yaJlCzDOtlU)
* [VIDEO - Getting started with JFlex](https://www.youtube.com/watch?v=IV1Rwq7ERR4&list=RDCMUC6-g6xhqyX14ENhZBC2fznw&start_radio=1&t=621)
