%{
	#include "abstract_syntax_tree.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror(char* s); 											// error handling function
	int yylex(); 													// declare the function performing lexical analysis
	extern int yylineno; 											// track the line number
%}

%union																// union to allow nodes to store return different datatypes
{
	char* text;
	expression_node* exp_node;
}
%token <text> T_ID T_NUM

%type <exp_node> E T F

/* specify start symbol */
%start START


%%
START : ASSGN	{ 
					printf("\nValid syntax\n");
	 				YYACCEPT;										// If program fits the grammar, syntax is valid
	 			}

/* Grammar for assignment */
ASSGN : T_ID '=' E	{
						// displaying the expression tree
						printf("Expression Tree:\n");
						display_exp_tree($3);
					}
	;

/* Expression Grammar */
E : E '+' T 	{
					// create a new node of the AST and set left and right children appropriately
					expression_node* node = init_exp_node("+", $1, $3);
					$$ = node;
				}
	| E '-' T 	{
					// create a new node of the AST and set left and right children appropriately
					expression_node* node = init_exp_node("-", $1, $3);
					$$ = node;
				}
	| T 	{ $$ = $1; }
	;
	
	
T : T '*' F 	{
					// create a new node of the AST and set left and right children appropriately
					expression_node* node = init_exp_node("*", $1, $3);
					$$ = node;
				}
	| T '/' F 	{
					// create a new node of the AST and set left and right children appropriately
					expression_node* node = init_exp_node("/", $1, $3);
					$$ = node;
				}
	| F {
			//pass AST node to the parent
			$$ = $1;
		}
	;

F : '(' E ')' { $$ = $2; }
	| T_ID 	{
				// creating a terminal node of the AST
				expression_node* node = init_exp_node($1, NULL, NULL);
				$$ = node;
			}
	| T_NUM 	{
					// creating a terminal node of the AST
					expression_node* node = init_exp_node($1, NULL, NULL);
					$$ = node;
				}
	;

%%


/* error handling function */
void yyerror(char* s)
{
	printf("Error :%s at %d \n",s,yylineno);
}


/* main function - calls the yyparse() function which will in turn drive yylex() as well */
int main(int argc, char* argv[])
{
	yyparse();
	return 0;
}