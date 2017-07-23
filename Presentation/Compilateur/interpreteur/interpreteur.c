#include "interpreteur.h"
#include <unistd.h>



void add_instr(char* op, int A, int B, int C)
{
  if(table_length >= MAX_SIZE)
  {
    printf("NO MORE SPACE INTO INSTRUCTIONS TABLE\n");
  }
  else
  {
    memset(asm_instructions[table_length].op, '\0', sizeof(asm_instructions[table_length].op));
    strcpy(asm_instructions[table_length].op,op);
    asm_instructions[table_length].A = A;
    asm_instructions[table_length].B = B;
    asm_instructions[table_length].C = C;
    table_length++;
  }
}

void print_table(){
  int instructions_counter = 0;
  printf("\n");
  while(instructions_counter < table_length){
    printf("OP(%d): %s %d %d %d\n", instructions_counter, asm_instructions[instructions_counter].op, asm_instructions[instructions_counter].A, asm_instructions[instructions_counter].B, asm_instructions[instructions_counter].C);
    instructions_counter++;
  }
}

void print_registers(){
  int registers_counter = 0;
  printf("\n");
  while(registers_counter < 31){
    printf("REG(%d): %d\n", registers_counter, registers[registers_counter]);
    registers_counter++;
  }
}

void process(){
  printf("\n");
  int instructions_counter = 0;
  int counter = 0;
  while(instructions_counter < table_length)
  {
	printf("%d %s %d %d %d\n", instructions_counter, asm_instructions[instructions_counter].op, asm_instructions[instructions_counter].A, asm_instructions[instructions_counter].B, asm_instructions[instructions_counter].C) ; 
    if(!strcmp(asm_instructions[instructions_counter].op,"ADD")) {
      registers[asm_instructions[instructions_counter].A] = registers[asm_instructions[instructions_counter].B] + registers[asm_instructions[instructions_counter].C];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"SOU")) {
      registers[asm_instructions[instructions_counter].A] = registers[asm_instructions[instructions_counter].B] - registers[asm_instructions[instructions_counter].C];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"MUL")) {
      registers[asm_instructions[instructions_counter].A] = registers[asm_instructions[instructions_counter].B] * registers[asm_instructions[instructions_counter].C];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"DIV")) {
      registers[asm_instructions[instructions_counter].A] = registers[asm_instructions[instructions_counter].B] / registers[asm_instructions[instructions_counter].C];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"COP")) {
      registers[asm_instructions[instructions_counter].A] = registers[asm_instructions[instructions_counter].B];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"AFC")) {
      registers[asm_instructions[instructions_counter].A] = asm_instructions[instructions_counter].B;
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"LOAD")) {
      registers[asm_instructions[instructions_counter].A] = data_memory[asm_instructions[instructions_counter].B+registers[13]];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"LDR")) {
       registers[asm_instructions[instructions_counter].A] = data_memory[registers[asm_instructions[instructions_counter].B]+registers[13]];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"STORE")) {
      data_memory[asm_instructions[instructions_counter].A+registers[13]] = registers[asm_instructions[instructions_counter].B];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"STRR")) {
      data_memory[registers[asm_instructions[instructions_counter].A]+registers[13]] = registers[asm_instructions[instructions_counter].B];
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"EQU")) {
      if(registers[asm_instructions[instructions_counter].B] == registers[asm_instructions[instructions_counter].C]){
        registers[asm_instructions[instructions_counter].A] = 1;
      }
      else {
        registers[asm_instructions[instructions_counter].A] = 0;
      }
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"INF")) {
      if(registers[asm_instructions[instructions_counter].B] < registers[asm_instructions[instructions_counter].C]){
        registers[asm_instructions[instructions_counter].A] = 1;
      }
      else {
        registers[asm_instructions[instructions_counter].A] = 0;
      }
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"INFE")) {
      if(registers[asm_instructions[instructions_counter].B] <= registers[asm_instructions[instructions_counter].C]){
        registers[asm_instructions[instructions_counter].A] = 1;
      }
      else {
        registers[asm_instructions[instructions_counter].A] = 0;
      }
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"SUP")) {
      if(registers[asm_instructions[instructions_counter].B] > registers[asm_instructions[instructions_counter].C]){
        registers[asm_instructions[instructions_counter].A] = 1;
      }
      else {
        registers[asm_instructions[instructions_counter].A] = 0;
      }
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"SUPE")) {
      if(registers[asm_instructions[instructions_counter].B] >= registers[asm_instructions[instructions_counter].C]){
        registers[asm_instructions[instructions_counter].A] = 1;
      }
      else {
        registers[asm_instructions[instructions_counter].A] = 0;
      }
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"JMP")) {
      instructions_counter = asm_instructions[instructions_counter].A-1; 
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"JMPC")) {
      if(registers[asm_instructions[instructions_counter].B]==0){
        instructions_counter = asm_instructions[instructions_counter].A-1; 
      }
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"JMPR")) {
      instructions_counter = registers[asm_instructions[instructions_counter].A] -1 ; 
    }
    else if (!strcmp(asm_instructions[instructions_counter].op,"PRINT")) {
      printf("%d\n",registers[asm_instructions[instructions_counter].A]);
    }
    else {
      printf("ERROR IN OPERATION NAME (%d) : %s ", instructions_counter, asm_instructions[instructions_counter].op);
    }
    usleep(5000);
    instructions_counter++;
  }
}
