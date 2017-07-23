%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
main {yylval.str = strdup(yytext) ; return tMain;}
int {return tInt;}
if {return tIf;}
else {return tElse;}
while {return tWhile;}
const {return tConst;}
printf {return tPrint;}
NULL {return tNULL;}
\{ {return tAo;}
\} {return tAf;}
\(  {return tPo;}
\) {return tPf;}
\; {return tPV;}
\= {return tEqu;}
\, {return tVir;}
\+ {return tPlus;}
\- {return tMoins;}
\/ {return tDiv;}
\* {return tMul;}
\< {return tInf;}
\> {return tSup;}
\>\= {return tSupE;}
\<\= {return tInfE;}
\& {return tAddr;}
return {return tReturn;}
== {return tEquEqu;}
and {return tAnd;}
or {return tOr;}
[0-9]+ {yylval.nb = atoi (yytext); return tNb;}
[a-zA-Z][a-zA-Z0-9]* {yylval.str = strdup(yytext) ;  return tId;}
[\t] ;
[\n] ;
[\b] ;
%%
