parser : y.tab.o lex.yy.o y.tab.h table.o asm.o
		gcc  y.tab.o lex.yy.o table.o asm.o -ll -o parser

y.tab.c y.tab.h : file.yacc
				yacc -d file.yacc

lex.yy.c : lexeur.lex
			flex lexeur.lex

clean:
	rm -rf y.tab.o lex.yy.o y.tab.h table.o asm.o y.tab.c lex.yy.c y.tab.h
