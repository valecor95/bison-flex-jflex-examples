default:
	clear
	jflex BalPar2.l
	bison BalPar2.y -L java
	javac *.java
	
clean:
	rm BalPar2.java *.class Yylex.java Yylex.java\~
