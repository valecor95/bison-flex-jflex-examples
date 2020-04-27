default:
	clear
	flex -l Btree.l
	bison -d Btree.y 
	gcc -o Btree Btree.tab.c lex.yy.c -lm
clean:
	rm Btree Btree.tab.* lex.yy.c