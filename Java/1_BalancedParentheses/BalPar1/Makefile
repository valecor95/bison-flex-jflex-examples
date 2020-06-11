default:
	clear
	jflex BalPar.l
	bison BalPar.y -L java
	javac *.java
	
clean:
	rm BalPar.java *.class Yylex.java Yylex.java\~
