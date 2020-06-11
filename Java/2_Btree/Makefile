default:
	clear
	jflex Btree.l
	bison Btree.y -L java
	javac *.java
	
clean:
	rm Btree.java *.class Yylex.java Yylex.java\~
