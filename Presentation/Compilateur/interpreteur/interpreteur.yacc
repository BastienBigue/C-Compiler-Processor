%{
#include <stdio.h>
#include <string.h>
%}
%union{
		char * str;
		int nb;
	};
%token <str> tADD tMUL tSUB tDIV tCOP tAFC tLOAD tSTORE tEQU tINF tINFE tSUP tSUPE tJMP tJMPC tPRINT tJMPR tSTRR tLDR
%token <nb> tNb
%start Prog

%%

Prog : Instructions ;
Instructions : {process();}
		| Instruction Instructions ;
Instruction :
		| tADD tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tMUL tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tSUB tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tDIV tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tCOP tNb tNb tNb {add_instr($1,$2,$3,-1);}
		| tAFC tNb tNb tNb {add_instr($1,$2,$3,-1);}
		| tLOAD tNb tNb tNb {add_instr($1,$2,$3,-1);}
		| tLDR tNb tNb tNb {add_instr($1,$2,$3,-1);}
		| tSTORE tNb tNb tNb {add_instr($1,$2,$3,-1);}
		| tSTRR tNb tNb tNb {add_instr($1,$2,$3,-1);}
		| tEQU tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tINF tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tINFE tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tSUP tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tSUPE tNb tNb tNb {add_instr($1,$2,$3,$4);}
		| tJMP tNb tNb tNb {add_instr($1,$2,-1,-1);}
		| tJMPR tNb tNb tNb {add_instr($1,$2,-1,-1);}
		| tJMPC tNb tNb tNb {add_instr($1,$2,$3,-1);}
		| tPRINT tNb tNb tNb {add_instr($1,$2,-1,-1);} ;


%%

yyerror (char *s) {
   fprintf (stderr, "%s\n", s);
 }

main() {
	yyparse() ;
}
