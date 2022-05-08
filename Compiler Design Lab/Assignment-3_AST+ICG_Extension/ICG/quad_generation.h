#include <stdio.h>
extern FILE* icg_quad_file;		//pointer to the output file
extern int temp_no;				//variable to keep track of current temporary count
extern int label_no;            //variable to keep track of current Label count

void quad_code_gen(char* a, char* b, char* op, char* c);
void quad_code_new_test();
char* new_temp();
char* new_label();