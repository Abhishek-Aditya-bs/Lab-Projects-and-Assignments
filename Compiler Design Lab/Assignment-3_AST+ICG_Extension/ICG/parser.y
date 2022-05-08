%{
	#include "quad_generation.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	#define YYSTYPE char*

	void yyerror(char* s); 											// error handling function
	int yylex(); 													// declare the function performing lexical analysis
	extern int yylineno; 											// track the line number

	FILE* icg_quad_file;
	int temp_no = 1;
	int label_no = 1;
	char* label;
	char* label_1;
%}

%token T_ID T_NUM IF ELSE


%nonassoc IF ELSE


/* specify start symbol */
%start START

%%
START	: SEQ {
							quad_code_new_test();
							YYACCEPT;
							printf("\nValid Syntax\n");
						};

SEQ	: statements SEQ
	| statements
	;

statements
 	: IF '(' condition ')' '{' SEQ '}' { 
		quad_code_gen(label," ","Label"," ");
	}
	| IF '(' condition ')' '{' SEQ '}' {
		label_1 = new_label();
		quad_code_gen(label_1," ","goto"," ");
		quad_code_gen(label," ","Label"," ");
	} ELSE '{' SEQ '}' { 
		quad_code_gen(label_1," ","Label"," ");
	}
	| ASSGN
	;

condition 	
	: E RELOP E {
								$$ = new_temp();
								quad_code_gen($$,$1,$2,$3);
								label_1 = new_label();
								quad_code_gen(label_1,$$,"if"," ");
								label = new_label();
								quad_code_gen(label," ","goto"," ");
								quad_code_gen(label_1," ","Label"," ");
							}
	;

RELOP 
		: '<' { $$="<";}
		| '>' { $$=">";}
		| '>''=' { $$=">=";}
		| '<''=' { $$="<=";} 
		| '=''=' { $$="==";}
		| '!''=' { $$="!=";}
;

/* Grammar for assignment */
ASSGN : T_ID '=' E ';'	{	//call quad_code_gen with appropriate parameters
													quad_code_gen($1,$3,"="," ");
												}
	;

/* Expression Grammar */
E : E '+' T 	{	//create a new temporary and call quad_code_gen with appropriate parameters	
								$$ = new_temp();
								quad_code_gen($$,$1,"+",$3);
							}
	| E '-' T 	{	//create a new temporary and call quad_code_gen with appropriate parameters	
								$$ = new_temp();
								quad_code_gen($$,$1,"-",$3);
							}
	| T
	;
	
	
T : T '*' F 	{	//create a new temporary and call quad_code_gen with appropriate parameters	
								$$ = new_temp();
								quad_code_gen($$,$1,"*",$3);
							}
	| T '/' F 	{	//create a new temporary and call quad_code_gen with appropriate parameters	
								$$ = new_temp();
								quad_code_gen($$,$1,"/",$3);						
							}
	| F
	;

F : '(' E ')'	{ $$ = $2; }
	| T_ID 	
	| T_NUM	
	;

%%


/* error handling function */
void yyerror(char* s)
{
	printf("Error:%s at %d \n",s,yylineno);
}


/* main function - calls the yyparse() function which will in turn drive yylex() as well */
int main(int argc, char* argv[])
{
	icg_quad_file = fopen("icg_quad.txt","a");
	yyparse();
	fclose(icg_quad_file);
	return 0;
}