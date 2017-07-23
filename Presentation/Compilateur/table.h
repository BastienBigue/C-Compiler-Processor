#include "stdio.h"

#define TAB_LENGTH 255

/* Indice de la dernière instruction */
int last_instructions_index;

/* Représente une variable : son nom, si elle est initialisée, sa profondeur */
typedef struct{
	char name[20] ;
	int initialized  ;
	int depth ;
} variable ;

/*Caractérise une fonction : son nom et l'indice de sa première instruction */
typedef struct{
	char name[20] ;
	int first_instruction_number ;
	int sym_counter ; 
} function ;

extern variable symbol_table[TAB_LENGTH];

extern function function_table[TAB_LENGTH];

variable initialize_variable(char * name, int initialized,int depth) ;

void add_symbol(char * name, int initialize) ;

void delete_symbolDepth(int depth_to_del) ;

void inc_depth() ;

void dec_depth() ;

int get_depth() ;

void print_table() ;

void add_tmp() ;

void delete_last_sym() ;

void delete_all_tmp() ;

void print_function_table() ;

void add_function(char * name) ;

int get_function_line(char * name) ;

void inc_sym_counter(char * fct_name) ; 

void dec_sym_counter(char * fct_name) ; 

extern int find_var_name_inv(char * name) ;
