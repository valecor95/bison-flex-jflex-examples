default:
	clear
	flex -l CNF3.l
	bison -d CNF3.y 
	gcc -o CNF3 CNF3.tab.c lex.yy.c -lm

clean:
	rm CNF3 CNF3.tab.* lex.yy.c
