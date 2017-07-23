interpreteur : y.tab.o lex.yy.o y.tab.h interpreteur.o
		gcc  y.tab.o lex.yy.o interpreteur.o -lfl -o interpreteur

y.tab.c y.tab.h : interpreteur.yacc
				yacc -d interpreteur.yacc

lex.yy.c : interpreteur.lex
			flex interpreteur.lex

clean:
	rm -rf y.tab.o lex.yy.o y.tab.h interpreteur.o y.tab.c lex.yy.c y.tab.h
