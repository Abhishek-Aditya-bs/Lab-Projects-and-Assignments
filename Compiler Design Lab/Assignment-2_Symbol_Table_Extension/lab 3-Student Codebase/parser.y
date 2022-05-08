%{
	// #include "sym_tab.c"
	#include "sym_tab.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	// #define YYSTYPE char*

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
	int scope = 0;
	int size = 0;
	char type_mappings[5][6] = {"","CHAR", "INT", "FLOAT", "DOUBLE"};

	char* itoa(int val, int base){
	static char buf[32] = {0};
	int i = 30;
	for(; val && i ; --i, val /= base)
		buf[i] = "0123456789abcdef"[val % base];
	return &buf[i+1];
	
}
%}

%union{
	char* value;
	struct{
		char* value;
		int type;
	}node_value;
}
%token<value> T_INT T_CHAR T_DOUBLE T_WHILE  T_INC T_DEC  T_OROR T_ANDAND T_EQCOMP T_NOTEQUAL T_GREATEREQ T_LESSEREQ T_LEFTSHIFT T_RIGHTSHIFT T_PRINTLN T_STRING  T_FLOAT T_BOOLEAN T_IF T_ELSE T_DO T_INCLUDE T_HEADER T_MAIN

%type<node_value> F
%type<node_value> T
%type<node_value> E
%type<node_value> EXPR
%type<node_value> VAR

%token<value> T_ID
%token<value> T_NUM
%token<value> T_STRLITERAL

%start START


%nonassoc T_IFX
%nonassoc T_ELSE

%%
START 	: PROG { printf("Valid syntax\n"); YYACCEPT; }	
        ;	
	  
PROG 	:  MAIN PROG				
		|  DECLR ';' PROG 				
		|  ASSGN ';' PROG 			
		| 					
		;
	 

DECLR 	: TYPE LISTVAR 
		;	


LISTVAR 	: LISTVAR ',' VAR 
	 	 	| VAR
	  		;

VAR				: 	T_ID '=' EXPR 	{
					/*
				    check if symbol is in the table
				    if it is then error for redeclared variable
				    else make entry and insert into table
				    insert value coming from EXPR
				    revert variables to default values:value,type
                   	*/
					if(check_symbol_table($1)){
						printf("\033[91mSymbol Table Error\033[0m: %d Variable %s already declared \n",yylineno,$1);
					}
					else{
						symbol* s = allocate_space_for_table_entry($1, size, type_specifier, yylineno, scope);
						int flag = insert_into_table(s);
						if (flag == 0){
							printf("\033[91m Error Inserting into Symbol Table\033[0m: %d \n",yylineno);
						}
						getSymbolTableEntry($1)->val = $3.value;
					}

				}
     			| T_ID {
				/*
				finished in lab 2
				*/
				if(check_symbol_table($1)==0){
					symbol* s = allocate_space_for_table_entry($1, size, type_specifier, yylineno, 1);
					if(!insert_into_table(s)){
						printf("\033[91mSymbol Table Error\033[0m:%s at %d \n",$1,yylineno);
					}
				}
				else{
					printf("\033[91mSymbol Table Error\033[0m: %d Variable %s already declared \n",yylineno,$1);
				}
			}
			;	 

//assign type here to be returned to the declaration grammar
TYPE 	:   T_INT {type_specifier=2; size=4;}
       	| 	T_FLOAT {type_specifier=3; size=4;}
       	| 	T_DOUBLE {type_specifier=4;size=8;}
       	| 	T_CHAR {type_specifier=1; size=1;}
       	;
    
/* Grammar for assignment */   
ASSGN 	: T_ID '=' EXPR {
					/*
               			 Check if variable is declared in the table
               			 insert value
            		*/
					if(check_symbol_table($1)){
						getSymbolTableEntry($1)->val = $3.value;
					}
					else{
						printf("\033[91mSymbol Table Error\033[0m: Lineno %d Variable %s not declared \n",yylineno,$1);
					}
				}
		;

EXPR 	: EXPR REL_OP E
		//store value using value variable declared before
       	| E {
			   $$ = $1;
		   }	 
       	;
	   
/* Expression Grammar */	   
E 		: E '+' T 	{ 
		/*
		        check type
		        if character type return error
		        convert to int/float perform calculation
		        convert back to string 
		        copy to grammar rule E
          	*/
		  	if($3.type == 1){
				printf("\033[91mType Mismatch\033[0m: Lineno %d Got Type %s Expected %s\n",yylineno,type_mappings[$3.type],type_mappings[$1.type]);
			}
			if($1.type == 1){
				printf("\033[91mType Mismatch\033[0m: Lineno %d Got type %s Expected %s\n",yylineno,type_mappings[$1.type],type_mappings[$3.type]);
			}

			char * operand1 = $1.value;
			char * operand2 = $3.value;

			double op1 = atof(operand1);
			double op2 = atof(operand2);
			double res = op1 + op2;
			char buffer[1024];
			sprintf(buffer,"%lf", res);
			$$.value = strdup(buffer);
			// else if($1.type == 2){
			// 	int temp =  atoi($1.value) + atoi($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
			// else if($1.type == 3){
			// 	float temp =  atof($1.value) + atof($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
			// else if($1.type == 4){
			// 	float temp =  atof($1.value) + atof($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
		}
    	| E '-' T 	{ 
		/*
			check type
			if character type return error
			convert to int/float perform calculation
			convert back to string 
			copy to grammar rule E
            	*/
			if($3.type == 1){
				printf("\033[91mType Mismatch\033[0m: Lineno %d Got Type %s Expected %s\n",yylineno,type_mappings[$3.type],type_mappings[$1.type]);
			}
			if($1.type == 1){
				printf("\033[91mType Mismatch\033[0m: Lineno %d Got type %s Expected %s\n",yylineno,type_mappings[$1.type],type_mappings[$3.type]);
			}

			char * operand1 = $1.value;
			char * operand2 = $3.value;

			double op1 = atof(operand1);
			double op2 = atof(operand2);
			double res = op1 - op2;
			char buffer[1024];
			sprintf(buffer,"%lf", res);
			$$.value = strdup(buffer);
			// else if($1.type == 2){
			// 	int temp =  atoi($1.value) - atoi($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
			// else if($1.type == 3){
			// 	float temp =  atof($1.value) - atof($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
			// else if($1.type == 4){
			// 	float temp =  atof($1.value) - atof($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
		}
		//copy value from T to grammar rule E
    	| T {
			$$ = $1;
		}
    	;
	
	
T 		: T '*' F 	{ 
		/*
		        check type
		        if character type return error
		        convert to int/float perform calculation
		        convert back to string 
		        copy to grammar rule T
            	*/
			if($3.type == 1){
				printf("\033[91mType Mismatch\033[0m: Lineno %d Got Type %s Expected %s\n",yylineno,type_mappings[$3.type],type_mappings[$1.type]);
			}
			if($1.type == 1){
				printf("\033[91mType Mismatch\033[0m: Lineno %d Got type %s Expected %s\n",yylineno,type_mappings[$1.type],type_mappings[$3.type]);
			}
			char * operand1 = $1.value;
			char * operand2 = $3.value;

			double op1 = atof(operand1);
			double op2 = atof(operand2);
			double res = op1 * op2;
			char buffer[1024];
			sprintf(buffer,"%lf", res);
			$$.value = strdup(buffer);
			// else if($1.type == 2){
			// 	int temp =  atoi($1.value) * atoi($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
			// else if($1.type == 3){
			// 	float temp =  atof($1.value) * atof($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
			// else if($1.type == 4){
			// 	float temp =  atof($1.value) * atof($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
		}
    	| T '/' F 	{ 
		/*
		        check type
		        if character type return error
		        convert to int/float perform calculation
		        convert back to string 
		        copy to grammar rule T
           	*/
			if($3.type == 1){
				printf("\033[91mType Mismatch\033[0m: Lineno %d Got Type %s Expected %s\n",yylineno,type_mappings[$3.type],type_mappings[$1.type]);
			}
			if($1.type == 1){
				printf("\033[91mType Mismatch\033[0m: Lineno %d Got type %s Expected %s\n",yylineno,type_mappings[$1.type],type_mappings[$3.type]);
			}

			char * operand1 = $1.value;
			char * operand2 = $3.value;

			double op1 = atof(operand1);
			double op2 = atof(operand2);
			double res = op1 / op2;
			char buffer[1024];
			sprintf(buffer,"%lf", res);
			$$.value = strdup(buffer);
			// else if($1.type == 2){
			// 	int temp =  atoi($1.value) / atoi($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
			// else if($1.type == 3){
			// 	float temp =  atof($1.value) / atof($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
			// else if($1.type == 4){
			// 	float temp =  atof($1.value) / atof($3.value);
			// 	char buffer[1024];
			// 	sprintf(buffer,"%f",temp);
			// 	$1.value = strdup(buffer);
			// }
		}
		//copy value from F to grammar rule T
    	| F { 
			$$ = $1;
		}
    	;

F	 	: '(' EXPR ')'
    	| T_ID 	{
				/*
		        check if variable is in table
		        check the value in the variable is default
		        if yes return error for variable not initialised
		        else duplicate value from T_ID to F
		        check for type match
		        (secondary type variable used here)
            	*/

				if(check_symbol_table($1)){
						if(checkDefaultValue($1)){
							printf("\033[91mSymbol Table Error\033[0m: %d Variable not initialised %s  \n",yylineno,$1);
						}
						else{
							$$.value = strdup(getSymbolTableEntry($1)->val);
							$$.type = getSymbolTableEntry($1)->type;
							if(getSymbolTableEntry($1)->type != $$.type){
								printf("\033[91mType Mismatch\033[0m: Lineno %d Variable %s Expected %s\n",yylineno,$1, type_mappings[$$.type]);
							}
							else{
								$$.value = strdup(getSymbolTableEntry($1)->val);
							}
						}
					}
				}
    	| T_NUM {
    		/*
		        duplicate value from T_NUM to F
		        check for type match
		        (secondary type variable used here)
                */
				$$.value = strdup($1);
				$$.type = 4;
			}
    	| T_STRLITERAL {
            	/*
			duplicate value from T_STRLITERAL to F
			check for type match
			(secondary type variable used here)
            	*/

				$$.value = strdup($1);
				$$.type = 1;
		}
    	;
		
REL_OP 	:   T_LESSEREQ
		| 	T_GREATEREQ
		| 	'<' 
		| 	'>' 
		| 	T_EQCOMP
		| 	T_NOTEQUAL
	   	;	


/* Grammar for main function */
//increment and decrement at particular points in the grammar to implement scope tracking
MAIN 	: TYPE T_MAIN '(' EMPTY_LISTVAR ')' '{' {scope++;}STMT '}' {scope--;}
		;

EMPTY_LISTVAR 	: LISTVAR
				|	
				;

STMT 	: STMT_NO_BLOCK STMT
       	| BLOCK STMT
       	|
       	;


STMT_NO_BLOCK 	: DECLR ';'
       			| ASSGN ';'
       			| T_IF '(' COND ')' STMT %prec T_IFX	/* if loop*/
       			| T_IF '(' COND ')' STMT T_ELSE STMT	/* if else loop */ 
       			;
       
//increment and decrement at particular points in the grammar to implement scope tracking
BLOCK 	: '{' {scope++;} STMT '}' {scope--;}
		;

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
	t = allocate_space_for_table();
	yyparse();
	/* display final symbol table*/
	display_symbol_table();
	return 0;

}
