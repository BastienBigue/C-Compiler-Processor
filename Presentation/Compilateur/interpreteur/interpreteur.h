#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_SIZE 255

typedef struct{
	char op[20] ;
	int A ;
	int B ;
  int C ;
} instruction ;

instruction asm_instructions [MAX_SIZE];
int data_memory [MAX_SIZE];
int registers [32];
int table_length = 0;



void add_instr(char* op, int A, int B, int C);

void print_table();

void process();
