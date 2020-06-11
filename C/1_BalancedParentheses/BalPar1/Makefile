default:
	clear
	flex -l BalPar.l
	bison -d BalPar.y 
	gcc -o BalPar BalPar.tab.c lex.yy.c -lm

clean:
	rm BalPar BalPar.tab.* lex.yy.c 
