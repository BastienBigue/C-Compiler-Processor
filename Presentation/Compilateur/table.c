#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "table.h"

int curr_index = 0 ;
int curr_depth = 0 ;
int function_index = 0;

extern int indexInstr ; 

variable symbol_table[TAB_LENGTH];
function function_table[TAB_LENGTH];



/* Ajoute un symbole dans la table des symboles.*/
void add_symbol(char * name, int initialized) { 
	if (curr_index < TAB_LENGTH) {
		strcpy(symbol_table[curr_index].name, name);
		symbol_table[curr_index].initialized = initialized;
		symbol_table[curr_index].depth = curr_depth;
		curr_index++ ;
	}
	else {
		printf("FULL SYMBOL TABLE\n") ;
		exit(-1) ;
	}
}

/*Ajoute une fonction dans la table des fonctions : la première instruction de la fonction est l'instruction courante.*/
void add_function(char* name)
{	
	if (function_index < TAB_LENGTH) {
		strcpy(function_table[function_index].name,name);
		function_table[function_index].first_instruction_number = indexInstr+ 2 ; //+2 car on part de -1 et l'instruction 0 est pour jumper dans le main pointe sur la fin de la fonction précédente.
		function_index++;
	}
	else {
		printf("FULL FUNCTION TABLE\n");
		exit(-1);
	}
}

/* Retourne l'indice de la première instruction de la fonction passée en paramètres */
int get_function_line(char * name) {
	int index = 0;
	while(strcmp(function_table[index].name,name)) {
		index++;
	}
	return function_table[index].first_instruction_number;
}

/* Affiche la table des fonctions */ 
void print_function_table() {
	int index = 0;
	printf("\n");
	while(index < function_index)
	{
		printf("FUNCTION(%d): %s | %d\n",index, function_table[index].name, function_table[index].first_instruction_number);
		index++;
	}
}


/* Supprime les symboles de profondeur donnée dans la table des symboles */ 
void delete_symbolDepth(int depth_to_del) {
	while (symbol_table[curr_index-1].depth == depth_to_del) {
		strcpy(symbol_table[curr_index].name, "") ;
		symbol_table[curr_index].initialized = 0 ;
		symbol_table[curr_index].depth = 0 ;
		curr_index-- ;
	}
}

/* Incrémente la profondeur */
void inc_depth() {
	curr_depth++;
}

/* Décrémente la profondeur */
void dec_depth() {
	curr_depth--;
}

/* Renvoie la profondeur */
int get_depth() {
	return curr_depth ;
}

/* Affiche la table des symboles. */ 
void print_table()
{
	printf("\nDISPLAY SYMBOL TABLE:\n");
	int i;
	for (i=0; i<curr_index; i++){
		printf("INDEX: %d | SYMBOL:\nNAME: %s | INI: %d | DEPTH: %d\n\n", i, symbol_table[i].name, symbol_table[i].initialized, symbol_table[i].depth);
	}
	printf("\n") ;
}

/* Ajoute une variable temporaire dans la table des symboles. */ 
void add_tmp() {
	if (curr_index < TAB_LENGTH -1) {
		char name[20];
		sprintf(name,"tmp%d", curr_index);
		strcpy(symbol_table[curr_index].name, name);
		symbol_table[curr_index].initialized = 0;
		symbol_table[curr_index].depth = curr_depth;
		curr_index++ ;
	}
	else {
		printf("FULL SYMBOL TABLE\n") ;
		exit(-1) ;
	}
}

/* Supprime la dernière variable de la table des symboles. */
void delete_last_sym()
{
  strcpy(symbol_table[curr_index].name, "") ;
  symbol_table[curr_index].initialized = 0 ;
  symbol_table[curr_index].depth = 0 ;
  curr_index-- ;
}


/* Trouve la dernière variable déclarée ayant le nom donné. */
int find_var_name_inv(char * name) {
	int i = curr_index ;
	while(strcmp(name, symbol_table[i].name) && i > 0) {
		i--;
	}
	return i;
}

