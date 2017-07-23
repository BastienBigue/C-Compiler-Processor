#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "asm.h"
#include "table.h"

extern int curr_index;


listeInstrs liste = {"NOP", "0", "0", "0", -1};

listeInstrs * pLastElement = &liste ;

int indexInstr = -1 ;

int nb_param = 0 ;

int indice_arg = 0 ;

int indice_param = 0 ;


/* Ajoute une instruction à la liste des instructions. */
void add(char * op, char* A, char* B, char* C) {
	instr newInstr;
	strcpy(newInstr.op, op);
	strcpy(newInstr.rA, A);
	strcpy(newInstr.rB, B);
	strcpy(newInstr.rC, C);
	newInstr.indice = ++indexInstr;
	(*pLastElement).pInstr = malloc(sizeof(listeInstrs));
	(*((*pLastElement).pInstr)).ins = newInstr;
	(*((*pLastElement).pInstr)).pInstr = NULL ;
	(*((*pLastElement).pInstr)).pPrev = &(*pLastElement);
	pLastElement = (*pLastElement).pInstr;
}

/* Ajoute la première instuction de la liste des instructions (à utiliser pour le JMP au main) */
void add_first(char * op, char* A, char* B, char* C) {
	instr newInstr;
	strcpy(newInstr.op, op);
	strcpy(newInstr.rA, A);
	strcpy(newInstr.rB, B);
	strcpy(newInstr.rC, C);
	newInstr.indice = 0;
	listeInstrs * pNextElement = liste.pInstr;
	liste.pInstr = malloc(sizeof(listeInstrs));
	(*(liste.pInstr)).ins = newInstr;
	(*(liste.pInstr)).pInstr = pNextElement ;
	(*(liste.pInstr)).pPrev = &liste;
	listeInstrs * liste_inter = pNextElement;
	while(liste_inter != NULL){
		(*liste_inter).ins.indice++;
		liste_inter = (*liste_inter).pInstr;
	}
}

/*Renvoie le code opératoire entier associé à l'opération donnée */
int op_to_code(char* string) {
	int resultat = 0;
	if (!strcmp(string, "ADD"))
	{
		resultat = 1;
	} else if (!strcmp(string, "MUL")) {
		resultat = 2;
	} else if (!strcmp(string, "SOU")) {
		resultat = 3;
	} else if (!strcmp(string, "DIV")) {
		resultat = 4;
	} else if (!strcmp(string, "COP")) {
		resultat = 5;
	} else if (!strcmp(string, "AFC")) {
		resultat = 6;
	} else if (!strcmp(string, "LOAD")) {
		resultat = 7;
	} else if (!strcmp(string, "STORE")) {
		resultat = 8;
	} else if (!strcmp(string, "EQU")) {
		resultat = 9;
	} else if (!strcmp(string, "INF")) {
		resultat = 10;
	} else if (!strcmp(string, "INFE")) {
		resultat = 11;
	} else if (!strcmp(string, "SUP")) {
		resultat = 12;
	} else if (!strcmp(string, "SUPE")) {
		resultat = 13;
	} else if (!strcmp(string, "JMP")) {
		resultat = 14;
	} else if (!strcmp(string, "JMPC")) {
		resultat = 15;
	} else if (!strcmp(string, "LDR")) {
		resultat = 112;
	} else if (!strcmp(string, "STRR")) {
		resultat = 128;
	} else if (!strcmp(string, "JMPR")) {
		resultat = 224;
	} else {
		resultat = -1;
	}
	return resultat;
}

/* Affiche la liste des instructions. */
void print_instructions_readable() {
	printf("\n\nInstructions lisibles\n\n");
	int i = 0 ;
	listeInstrs * liste_inter = &liste;
	liste_inter = (*liste_inter).pInstr; /* skip the first node */
	while(liste_inter != NULL){
		printf("%d %s %s %s %s\n", i, (*liste_inter).ins.op, (*liste_inter).ins.rA, (*liste_inter).ins.rB, (*liste_inter).ins.rC);
		liste_inter = (*liste_inter).pInstr;
		i++ ;
	 }
}

void print_instructions_for_interpreteur() {
	listeInstrs * liste_inter = &liste;
	liste_inter = (*liste_inter).pInstr; /* skip the first node */
	while(liste_inter != NULL){
		printf("%s %s %s %s\n", (*liste_inter).ins.op, (*liste_inter).ins.rA, (*liste_inter).ins.rB, (*liste_inter).ins.rC);
		liste_inter = (*liste_inter).pInstr;
	 }
}

/* Affiche la liste des instructions. */
void print_instructions() {
	printf("\n\nInstructions en hexadecimal\n\n");
	listeInstrs * liste_inter = &liste;
	liste_inter = (*liste_inter).pInstr; /* skip the first node */
	while(liste_inter != NULL){
		int numOP, numrA, numrB, numrC;
		numOP = op_to_code((*liste_inter).ins.op);
		sscanf((*liste_inter).ins.rA,"%d",&numrA);
		sscanf((*liste_inter).ins.rB,"%d",&numrB);
		sscanf((*liste_inter).ins.rC,"%d",&numrC);
		if ((!strcmp((*liste_inter).ins.op, "JMPC"))) {
			printf("%02x%04x%02x\n",numOP, ((numrA+1)*4), numrB);
		} else if ((!strcmp((*liste_inter).ins.op, "STORE"))) {
			printf("%02x%04x%02x\n",numOP, (numrA*2), numrB);
		} else if ((!strcmp((*liste_inter).ins.op, "JMP"))) {
			printf("%02x%04xff\n",numOP, ((numrA+1)*4));
		} else if ((!strcmp((*liste_inter).ins.op, "LOAD"))) {
			printf("%02x%02x%04x\n",numOP, numrA,(numrB*2));
		} else if ((!strcmp((*liste_inter).ins.op, "AFC"))) {
			printf("%02x%02x%04x\n",numOP, numrA, numrB);
		} else {
			printf("%02x%02x%02x%02x\n",numOP, numrA, numrB, numrC);
		}
		liste_inter = (*liste_inter).pInstr;
	 }
}

/* Produit le code assembleur pour un nombre. */
int terme(int value) {
	char number[20] ;
	sprintf(number, "%d",value);
	add("AFC","0",number,"-1");
	char address[20];
	sprintf(address, "%d",curr_index-1);
	add("STORE", address, "0", "-1");
	return curr_index-1;
}

/* Produit le code assembleur pour récupérer la valeur d'une variable déclarée et la mettre dans une variable temporaire. */
void tmp_id(int result_index) {
	char address[20] ;
	char result_chain[20];
	add_tmp();
	sprintf(result_chain, "%d",result_index);
	add("LOAD", "0", result_chain, "-1");
	sprintf(address, "%d",curr_index-1);
	add("STORE",address,"0","-1");
}

void tmp_pointer_val(int result_index) {
	char address[20] ;
	char result_chain[20];
	add_tmp();
	sprintf(result_chain, "%d",result_index);
	add("LOAD", "0", result_chain, "-1");
	add("LDR", "1", "0", "-1"); 
	sprintf(address, "%d",curr_index-1);
	add("STORE",address,"1","-1");
}

/* Produit le code assembleur pour une affecter la dernière variable temporaire créée à la variable déclarée donnée. */
void affectation(char* variable_name) {
		char address[20] ;
		char var_addr[20] ;
		sprintf(address, "%d",curr_index-1);
		sprintf(var_addr, "%d", find_var_name_inv(variable_name)) ;
		add("LOAD", "0", address, "-1");
		add("STORE", var_addr, "0", "-1");
		delete_last_sym();
}

void affectation_directe(char* variable_name) {
		delete_last_sym(); // on vient de déclarer une variable temporaire mais elle est inutile ! on la supprime ce qui permet de rendre l'emplacement disponible, anciennement pris par cette var-tmp, pour notre variable
		add_symbol(variable_name,1);
		char address[20] ;
		char var_addr[20] ;
		sprintf(address, "%d",curr_index-1);
		sprintf(var_addr, "%d", find_var_name_inv(variable_name)) ;
		add("LOAD", "0", address, "-1");
		add("STORE", var_addr, "0", "-1");

}

/* Produit le code assembleur pour une condition (if ou while). */
void condition(char * type) { 
	char left_chain[20] ;
	char right_chain[20] ;
	sprintf(left_chain, "%d",curr_index-2);
	sprintf(right_chain, "%d",curr_index-1);
	add("LOAD", "0", left_chain,"-1");
	add("LOAD", "1", right_chain,"-1");
	add(type, "0", "0","1");
	delete_last_sym();
	delete_last_sym();
	add("JMPC","X", "0", "-1") ;
}

/* Met à jour l'adresse du JMP situé à la fin du bloc if si jamais il y a un else.*/
void update_jump() {
	listeInstrs * liste_inter_inv = pLastElement;
	while(strcmp((*liste_inter_inv).ins.op,"JMP") || strcmp((*liste_inter_inv).ins.rA,"X")){
		liste_inter_inv = (*liste_inter_inv).pPrev;
	}
	char indice[6];
	sprintf(indice,"%d", ((*pLastElement).ins.indice+2)); // + 2 car sinon on tombe sur la dernière instruction du bloc if
	strcpy((*liste_inter_inv).ins.rA,indice);
}

/* Met à jour l'adresse du JMP situé au début du bloc if */
void update_jumpc() {

	listeInstrs * liste_inter_inv = pLastElement;
	while(strcmp((*liste_inter_inv).ins.op,"JMPC") || strcmp((*liste_inter_inv).ins.rA,"X")){
		liste_inter_inv = (*liste_inter_inv).pPrev;
	}
	char indice[6];
	sprintf(indice,"%d", ((*pLastElement).ins.indice+2)); // + 2 car sinon on tombe sur la dernière instruction du bloc if
	strcpy((*liste_inter_inv).ins.rA,indice);
}

/* Ajoute le jump pour revenir au début d'un while. */
void add_jump() {
	listeInstrs * liste_inter_inv = pLastElement;
	while(strcmp((*liste_inter_inv).ins.op,"JMPC") || strcmp((*liste_inter_inv).ins.rA,"X")){
		liste_inter_inv = (*liste_inter_inv).pPrev;
	}
	char indice_jump[6];
	char indice_jumpc[6];
	//Création du JMP avec condition
	sprintf(indice_jumpc,"%d", (*liste_inter_inv).ins.indice-6); // -6 car pour l'instant on considère qu'avant le JMPC on a 6 instrs (pas de ET ou de OU)
	add("JMP",indice_jumpc,"-1","-1");
	//Mise à jour de l'adresse à laquelle JMPC saute
	sprintf(indice_jump,"%d", (*pLastElement).ins.indice+2); // + 2 car sinon on tombe sur la dernière instruction du bloc if
	strcpy((*liste_inter_inv).ins.rA,indice_jump);


}

/* Produit le code assembleur pour print. */
void print_instr() {
	char chain[20] ;
	sprintf(chain, "%d",curr_index-1);
	add("LOAD","0",chain,"-1");
	add("PRINT","0","-1","-1");
	delete_last_sym();
}

/* Produit le code assembleur pour une opération + - * / */
void operation(char* op) {
	char chainA[20] ;
	char chainB[20] ;
	char tmp[20];
	sprintf(chainA, "%d",curr_index-2);
	sprintf(chainB, "%d",curr_index-1);
	add("LOAD","0",chainA,"-1");
	add("LOAD","1",chainB,"-1");
	delete_last_sym();
	delete_last_sym();
	add(op,"0","0","1");
	add_tmp();
	sprintf(tmp, "%d",curr_index-1);
	add("STORE", tmp,"0","-1");
}

/* Produit le code assembleur pour jumper à la première instruction de la fonction donnée*/
void jump_to_function(char * name) {
	char chain[20];
	sprintf(chain,"%d", get_function_line(name));
	add("JMP", chain,"-1","-1");
}

/* Ajoute le JMP pour aller dans le main en première instruction. */
void add_first_jump() {
	char chain[20];
	sprintf(chain,"%d", get_function_line("main"));
	add_first("JMP", chain,"-1","-1");
}


/* Ajoute l'adresse de retour dans la table des symboles. */
void add_return_addr() {
	char chain[20];
	add_tmp();
	sprintf(chain,"%d", curr_index-1); 
	add("STORE", chain, "14", "-1") ; 
}


/* Met l'adresse de retour dans le registre 14 lors d'une invocation de fonctions */
void return_addr_to_reg() {
	char return_addr[20] ;
	sprintf(return_addr, "%d", indexInstr+4) ; //+4 d'après les tests réalisés
	add("AFC", "14", return_addr, "-1") ;
}

/* Pour ajouter le JMP a la fin d'une fonction pour retourner dans la fonction appelante. 
Pour chaque fonction, on a l'adresse de retour a l'indice 0 de la table des symboles. */
void back_to_calling_fct() {
	add("LOAD", "0", "0", "-1") ; 
	add("JMPR", "0", "-1", "-1") ;
}

/* Décale le contexte lors d'un appel de fonction */
void shift_add() {
	char chain[20] ;
	sprintf(chain, "%d", curr_index) ;
	add("AFC", "12", chain, "-1") ;
	add("ADD", "13", "13", "12") ;
}

/* Décale le contexte lors du retour dans une fonction appelante */
void shift_sub() {
	char chain[20] ;
	sprintf(chain, "%d", curr_index) ;
	add("AFC", "12", chain, "-1") ;
	add("SOU", "13", "13", "12") ;
}

/* Remet la valeur d'indice_arg à 1  */
void reset_indice_arg() {
	indice_arg =  1 ; 
}

void inc_indice_arg() {
	indice_arg = indice_arg + 1  ;
}



/* A la déclaration d'une fonction : on ajoute un argument dans la table des symboles.
On récupère ensuite les valeurs de ses paramètres qui sont stockées dans les registres au moment de l'appel de la fonction.*/
void add_argument(char * variable) {
	add_symbol(variable,0) ;
	char var[20] ;
	sprintf(var, "%d", curr_index-1) ; 
	char indice[20] ;
	sprintf(indice, "%d", indice_arg) ;
	add("STORE", var, indice, "-1") ; //on récupère ce qui est dans le registre indice et on le met dans la table des symboles
	inc_indice_arg() ; //on incrémente l'indice des arguments pour l'argument suivant
}

/* Remet la valeur d'indice_param à 1 */
void reset_indice_param() {
	indice_param =  1 ; 
}

void inc_indice_param() {
	indice_param = indice_param + 1  ;
}

/* A l'appel d'une fonction, les paramètres sont mis dans les registres pour être récupérés par add_argument à l'entrée dans la fonction. */
void pass_all_parameters() {
	int i ;
	char reg[20] ;
	char addr_ts[20] ;
	for (i=1 ; i<indice_param ; i++) {
		sprintf(reg, "%d", i) ;
		sprintf(addr_ts, "%d", curr_index-i) ;
		add("LOAD", reg, addr_ts, "-1") ;
		delete_last_sym();
	}
}

/* Intilialise R13 à 0. R13 stocke le décalage du contexte */
void initialize_r13() {
	add("AFC", "13", "0", "-1");
}

/* Met la valeur de retour d'une fonction dans le registre 1 */
void save_return_value() {
	char chain[20] ;
	sprintf(chain, "%d", curr_index-1) ;
	add("LOAD", "1", chain, "-1") ;
}

/* Recupere la valeur de retour stockée dans le registre 1 */
void get_return_value() {
	add_tmp();
	char chain[20] ;
	sprintf(chain, "%d", curr_index-1) ;
	add("STORE", chain, "1", "-1") ;
}

/* Déclare et affecte un pointeur a la valeur NULL */
void  affectation_pointeur_directe_NULL(char* variable_name) {
	add_symbol(variable_name,1);
	char var_addr[20] ;
	sprintf(var_addr, "%d", find_var_name_inv(variable_name)) ;
	add("AFC", "0", "-1", "-1"); // index -1 dans la mémoire qui n'existe pas représentant la valeur "NULL"
	add("STORE", var_addr, "0", "-1");
}

/* Déclare et affecte un pointeur à une variable */
void affectation_pointeur_directe(char* variable_name, char* variable_to_point) {
	add_symbol(variable_name,1);
	char address[20];
	char var_addr[20] ;
	sprintf(var_addr, "%d", find_var_name_inv(variable_name)) ;
	sprintf(address, "%d", find_var_name_inv(variable_to_point)) ;
	add("AFC", "0", address, "-1"); 
	add("STORE", var_addr, "0", "-1");
}

/* Affecte un pointeur a la valeur NULL */
void  affectation_pointeur_NULL(char* variable_name) {
	char var_addr[20] ;
	sprintf(var_addr, "%d", find_var_name_inv(variable_name)) ;
	add("AFC", "0", "-1", "-1"); // index -1 dans la mémoire qui n'existe pas représentant la valeur "NULL"
	add("STORE", var_addr, "0", "-1");
}

/* Affecte un pointeur par référence */
void affectation_pointeur(char* variable_name, char* variable_to_point) {
	char address[20];
	char var_addr[20] ;
	sprintf(var_addr, "%d", find_var_name_inv(variable_name)) ;
	sprintf(address, "%d", find_var_name_inv(variable_to_point)) ;
	add("AFC", "0", address, "-1"); 
	add("STORE", var_addr, "0", "-1");
}

/* Affecte un pointeur par valeur */
void affectation_valeur_pointee(char* variable_name) {
	char address[20] ;
	char var_addr[20] ;
	sprintf(address, "%d",curr_index-1);
	sprintf(var_addr, "%d", find_var_name_inv(variable_name)) ;
	add("LOAD", "0", var_addr, "-1");
	add("LOAD", "1", address,"-1");
	add("STRR", "0", "1", "-1"); // On store à l'adresse contenue dans R0, la valeur contenue dans R1
	delete_last_sym();
}
