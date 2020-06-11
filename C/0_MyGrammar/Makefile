default:
	clear
	flex -l MyGrammar.l
	bison -d MyGrammar.y 
	gcc -o MyGrammar MyGrammar.tab.c lex.yy.c -lm
clean:
	rm MyGrammar MyGrammar.tab.* lex.yy.c