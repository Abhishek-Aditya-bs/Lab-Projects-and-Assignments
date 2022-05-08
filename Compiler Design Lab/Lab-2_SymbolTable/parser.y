%{
	#include "sym_tab.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#define YYSTYPE char*
	/*
		declare variables to help you keep track or store properties
		scope can be default value for this lab(implementation in the next lab)
	*/
	void yyerror(char* s); // error handling function
	int yylex(); // declare the function performing lexical analysis
	extern int yylineno; // track the line number
	extern char* yytext;
	extern table* t;
	int type_specifier = 0;
	int size = 0;
	

%}

%token T_INT T_CHAR T_DOUBLE T_WHILE  T_INC T_DEC   T_OROR T_ANDAND T_EQCOMP T_NOTEQUAL T_GREATEREQ T_LESSEREQ T_LEFTSHIFT T_RIGHTSHIFT T_PRINTLN T_STRING  T_FLOAT T_BOOLEAN T_IF T_ELSE T_STRLITERAL T_DO T_INCLUDE T_HEADER T_MAIN T_ID T_NUM

%start START


%%
START 	: PROG { printf("Valid syntax\n"); YYACCEPT; }	
		;	
	  
PROG	:  	MAIN PROG				
		|	DECLR ';' PROG 				
		| 	ASSGN ';' PROG 			
		| 					
		;
	 

DECLR 	: TYPE LISTVAR
		;	


LISTVAR : LISTVAR ',' VAR 
	  	| VAR
	  	;

VAR		: T_ID '=' EXPR 	{/*to be done in lab 3*/}
		| T_ID { /*
					check if symbol is in table
					if it is then print error for redeclared variable
					else make an entry and insert into the table
					revert variables to default values:type
                */
				// printf("Checking if T_ID is present in table\n");


				 if(check_symbol_table($1)==0){
					//  printf("Inserting into empty table\n");
					symbol* s = allocate_space_for_table_entry($1, size, type_specifier, yylineno, 1);
					if(!insert_into_table(s)){
						printf("\033[91mSymbol Table Error\033[0m:%s at %d \n",$1,yylineno);
					}
				}
				else{
					printf("\033[91mSymbol Table Error\033[0m: %d Variable %s already declared \n",yylineno,$1);
				}
			}
							
	 

//assign type here to be returned to the declaration grammar
TYPE 	: T_INT {type_specifier=2; size=4;}
       	| T_FLOAT {type_specifier=3; size=4;}
       	| T_DOUBLE {type_specifier=4;size=8;}
       	| T_CHAR {type_specifier=1;size=1;}
       	;
    
/* Grammar for assignment */   
ASSGN 	: T_ID '=' EXPR 	{/*to be done in lab 3*/}
		;

EXPR 	: EXPR REL_OP E
       	| E 
       	;
	   
E 	: E '+' T
    | E '-' T
    | T 
    ;
	
	
T 	: T '*' F
    | T '/' F
    | F
    ;

F 	: '(' EXPR ')'
    | T_ID
    | T_NUM 
    | T_STRLITERAL 
    ;

REL_OP :   	T_LESSEREQ
	   | 	T_GREATEREQ
	   | 	'<' 
	   | 	'>' 
	   | 	T_EQCOMP
	   | 	T_NOTEQUAL
	   ;	


/* Grammar for main function */
MAIN 	: TYPE T_MAIN '(' EMPTY_LISTVAR ')' '{' STMT '}';

EMPTY_LISTVAR 	: LISTVAR
				|	
				;

STMT 	: STMT_NO_BLOCK STMT
       	| BLOCK STMT
       	|
       	;


STMT_NO_BLOCK 	: DECLR ';'
       			| ASSGN ';' 
       			;

BLOCK 	: '{' STMT '}';

COND 	: EXPR 
       	| ASSGN
       	;


%%


/* error handling function */
void yyerror(char* s)
{
	printf("Error :%s at %d \n",s,yylineno);
}


int main(int argc, char* argv[])
{
	/* initialise table here */
	// printf("table allocation\n");
	t = allocate_space_for_table();
	yyparse();
	/* display final symbol table*/
	display_symbol_table();
	return 0;

}
