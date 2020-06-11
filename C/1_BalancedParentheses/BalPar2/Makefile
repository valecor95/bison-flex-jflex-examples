default:
	clear
	flex -l BalPar2.l
	bison -d BalPar2.y 
	gcc -o BalPar2 BalPar2.tab.c lex.yy.c -lm

clean:
	rm BalPar2 BalPar2.tab.* lex.yy.c 
