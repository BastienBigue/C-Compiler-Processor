%{
#include "y.tab.h"
%}

%%
ADD {yylval.str = strdup(yytext) ; return tADD;}
MUL {yylval.str = strdup(yytext) ; return tMUL;}
SOU {yylval.str = strdup(yytext) ; return tSUB;}
DIV {yylval.str = strdup(yytext) ; return tDIV;}
COP {yylval.str = strdup(yytext) ; return tCOP;}
AFC {yylval.str = strdup(yytext) ; return tAFC;}
LOAD {yylval.str = strdup(yytext) ; return tLOAD;}
LDR {yylval.str = strdup(yytext) ; return tLDR;}
STORE {yylval.str = strdup(yytext) ; return tSTORE;}
STRR {yylval.str = strdup(yytext) ; return tSTRR;}
EQU {yylval.str = strdup(yytext) ; return tEQU;}
INF {yylval.str = strdup(yytext) ; return tINF;}
INFE {yylval.str = strdup(yytext) ; return tINFE;}
SUP {yylval.str = strdup(yytext) ; return tSUP;}
SUPE {yylval.str = strdup(yytext) ; return tSUPE;}
JMP {yylval.str = strdup(yytext) ; return tJMP;}
JMPC {yylval.str = strdup(yytext) ; return tJMPC;}
JMPR {yylval.str = strdup(yytext) ; return tJMPR;}
PRINT {yylval.str = strdup(yytext) ; return tPRINT;}
[-]?[0-9]+ {yylval.nb = atoi (yytext); return tNb;}
[\t] ;
[\n] ;
[\b] ;
%%
