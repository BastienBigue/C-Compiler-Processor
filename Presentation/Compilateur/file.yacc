%{
#include <stdio.h>
#include <string.h>
#include "table.h"
#include "asm.h"
%}
%union{ 	int nb;
		char * str;
	};
%token tInt tPo tPf tAo tAf tPV tIf tWhile tPrint tEquEqu tAnd tPlus tMoins tMul tDiv tVir tEqu tElse tOr tConst tReturn tInf tSup tInfE tSupE tAddr tNULL
%token <str> tId tMain
%token <nb> tNb
%type <nb> E

%left tAnd tOr
%left tEqu tInf tSup tSupE tInfE
%left tPlus tMoins
%left tMul tDiv
%left tEquEqu
%left tPo tPf

%start Prog




%%

Prog :  Fonctions ;
Fonctions :
		| Fonction Fonctions
		| FonctionMain {print_instructions_for_interpreteur();} ;
FonctionMain : tInt tMain tPo {add_function($2);} Args tPf {initialize_r13();} Body { add_first_jump();} ;
Fonction : tInt tId {add_function($2); inc_depth() ; add_return_addr(); dec_depth() ;} tPo Args tPf Body  {back_to_calling_fct() ;};
Args :
		| tInt tId {reset_indice_arg(); inc_depth(); add_argument($2); } ArgsN  ;
ArgsN :	{dec_depth(); }
		| tVir tInt tId {add_argument($3); } ArgsN ;
Body : tAo {inc_depth();} Instrs tAf {delete_symbolDepth(get_depth()) ; dec_depth();   }
Instrs :
		| Aff Instrs
		| Decl  Instrs
		| Invoc tPV Instrs
		| If Instrs
		| While Instrs
		| tReturn E tPV {save_return_value();};
If : tIf tPo E tPf Body Else ;
Else : {update_jumpc();}
		| {add("JMP","X","-1","-1"); update_jumpc();} tElse Body {update_jump(); } ;
E : tId { tmp_id(find_var_name_inv($1)); }
		| tNb {add_tmp(); $$ = terme($1);}
		| tMul tId{tmp_pointer_val(find_var_name_inv($2)); }
		| E tEquEqu E {condition("EQU");}
		| E tAnd E
		| E tOr E
		| Invoc
		| tPo E tPf
		| E tPlus E {operation("ADD");}
		| E tMoins E {operation("SOU"); }
		| E tDiv E {operation("DIV"); }
		| E tMul E {operation("MUL"); }
		| E tInf E {condition("INF");}
		| E tSup E {condition("SUP");}
		| E tInfE E {condition("INFE");}
		| E tSupE E {condition("SUPE");} ;
Invoc : tPrint tPo E tPf {print_instr();}
		| tId tPo Params {shift_add();} tPf {return_addr_to_reg(); jump_to_function($1); shift_sub(); get_return_value();};
Params :
		| E {reset_indice_param(); inc_indice_param();} ParamsN ;
ParamsN : {pass_all_parameters();}
		| tVir E {inc_indice_param();} ParamsN ;
Aff : tId tEqu E tPV {affectation($1);}
		| tMul tId tEqu E tPV {affectation_valeur_pointee($2);}
		| tId tEqu tAddr tId tPV {affectation_pointeur($1,$4);}
		| tId tEqu tNULL tPV {affectation_pointeur_NULL($1);};
Decl1 : tId { add_symbol(strdup($1),0); }
		| tId tEqu E { affectation_directe($1); }
		| tMul tId {add_symbol(strdup($2),0); print_table();}
		| tMul tId tEqu tAddr tId { affectation_pointeur_directe($2,$5);}
		| tMul tId tEqu tNULL { affectation_pointeur_directe_NULL($2);} ;
Decl : tInt Decl1 DeclN
		| tConst tInt Decl1 DeclN ;
DeclN : tPV
		| tVir Decl1 DeclN ;
While : tWhile tPo E tPf Body {add_jump();};


%%

yyerror (char *s) {
   fprintf (stderr, "%s\n", s);
 }

main() {
	yyparse() ;
}
