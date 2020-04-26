default:
	clear
	flex -l G1.l
	bison -d G1.y 
	gcc -o G1 G1.tab.c lex.yy.c -lm

clean:
	rm G1 G1.tab.* lex.yy.c
