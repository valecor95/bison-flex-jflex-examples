default:
	clear
	jflex MyGrammar.l
	bison MyGrammar.y -L java
	javac *.java
	
clean:
	rm MyGrammar.java *.class Yylex.java Yylex.java\~
