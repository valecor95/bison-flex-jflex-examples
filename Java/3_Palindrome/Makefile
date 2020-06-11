default:
	clear
	jflex Palindrome.l
	bison Palindrome.y -L java
	javac *.java
	
clean:
	rm Palindrome.java *.class Yylex.java Yylex.java\~
