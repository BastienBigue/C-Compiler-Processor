#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct{
	char op[6] ;
	char rA[6]  ;
	char rB[6]  ;
	char rC[6]  ;
	int indice ;
} instr ;

typedef struct listeInstrs listeInstrs;
typedef struct listeInstrs{
	instr ins ;
	listeInstrs * pPrev ;
	listeInstrs * pInstr ;
} listeInstrs ;


int terme(int value);

void tmp_id(int result_index);

void affectation(char* variable_name);

void add(char * op, char * A, char * B, char * C) ;

void print_instructions() ;

void update_jump();

void update_jumpc();

void add_jump() ;

void print_instr();

void condition(char * type);

void operation(char* op);

void last_instr();

void next_instr_number();

void jump_to_function();

void add_first_jump() ;

void add_return_addr() ;

void add_argument(char * variable) ;

void return_addr_to_reg() ;

void return_to_register() ;

void back_to_calling_fct() ;

void shift_add() ;

void shift_sub() ;

void pass_parameter(char * param) ;

void inc_indice_param() ;

void reset_indice_param() ;

void reset_indice_arg() ;

void inc_indice_arg() ;

void initialize_r13() ;

void save_return_value() ;

void get_return_value() ;

void  affectation_pointeur_directe_NULL(char* variable_name) ;

void affectation_pointeur_directe(char* variable_name, char* variable_to_point) ;

void  affectation_pointeur_NULL(char* variable_name) ;

void affectation_pointeur(char* variable_name, char* variable_to_point) ;

void affectation_valeur_pointee(char* variable_name) ;

void tmp_pointer_val(int result_index) ;
