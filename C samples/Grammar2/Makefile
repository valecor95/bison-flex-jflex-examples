default:
	clear
	flex -l G2.l
	bison -d G2.y 
	gcc -o G2 G2.tab.c lex.yy.c -ll
