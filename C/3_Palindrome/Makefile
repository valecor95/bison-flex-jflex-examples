default:
	clear
	flex -l Palindrome.l
	bison -d Palindrome.y 
	gcc -o Palindrome Palindrome.tab.c lex.yy.c -lm

clean:
	rm Palindrome Palindrome.tab.* lex.yy.c
