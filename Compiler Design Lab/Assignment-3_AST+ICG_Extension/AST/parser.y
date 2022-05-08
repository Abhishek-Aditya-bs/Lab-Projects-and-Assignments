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
	if_node* if_node;
}

%token <text> T_ID T_NUM IF ELSE GQE NEQ LQE EQ 
%type <text> REL
%type <exp_node> E T F condition ASSGN
%type <if_node> statements seq

/* specify start symbol */
/* %define "parse.error" "verbose"
%error-verbose */
%start START


%%
START : statements { 
					display_if_tree($1);
					printf("\nValid syntax\n");
	 				YYACCEPT;										// If program fits the grammar, syntax is valid
	 			}

/* Grammar for assignment */
ASSGN : T_ID '=' E	{
											// displaying the expression tree
											$$ = init_exp_node(strdup("="),init_exp_node(strdup($1),NULL,NULL),$3);
										}
	;

/* Expression Grammar */
E : E '+' T 	{
								// create a new node of the AST and set left and right children appropriately
								$$ = init_exp_node(strdup("+"),$1,$3);
							}
	| E '-' T 	{
								// create a new node of the AST and set left and right children appropriately
								$$ = init_exp_node(strdup("-"),$1,$3);
							}
	| T 	{ $$ = $1;}
	;
	
	
T : T '*' F 	{
								// create a new node of the AST and set left and right children appropriately
								$$ = init_exp_node(strdup("*"),$1,$3);
							}
	| T '/' F 	{
								// create a new node of the AST and set left and right children appropriately
								$$ = init_exp_node(strdup("/"),$1,$3);
							}
	| F {
				//pass AST node to the parent
				$$ = $1; 
			}
	;

F : '(' E ')' { $$ = $2; }
	| T_ID 	{
						// creating a terminal node of the AST
						$$ = init_exp_node(strdup($1),NULL,NULL);
					}
	| T_NUM 	{
							// creating a terminal node of the AST
							$$ = init_exp_node(strdup($1),NULL,NULL);
						}
	;


statements 
	: IF '(' condition ')' '{' statements '}' {
																							$$ = init_if_node($3,$6,NULL,"if");
																						}

	| IF '(' condition ')' '{' statements '}' ELSE '{' statements '}' {
																																			// printf("IFE\n");
																																			$$ = init_if_node($3,$6,$10,"if-else");
																																		}
	| seq {
					$$ = init_if_node(NULL,$1,NULL,"seq");
				}
	;

seq
	: ASSGN ';' seq {
										$$ = init_if_node($1,NULL, $3,NULL);
									}

	| ASSGN ';' {$$ = init_if_node($1,NULL, NULL,NULL);}
	| IF '(' condition ')' '{' statements '}' seq {
																									$$ = init_if_node(NULL,init_if_node($3,$6,NULL,"if"),$8 ,NULL);
																								}
	| IF '(' condition ')' '{' statements '}' ELSE '{' statements '}' seq {
																																					$$ = init_if_node(NULL,init_if_node($3,$6,$10,"if-else"),$12 ,NULL);
																																				}
	| {$$=NULL;}
	;

condition 
	: E REL E {
							$$ = init_exp_node($2, $1, $3);
						}
	;

REL 
	: '<' {$$ = "<";}
	| '>' {$$ = ">";}
	| GQE {$$ = ">=";}
	| LQE {$$ = "<=";}
	| EQ {$$ = "==";}
	| NEQ {$$ = "!=";}
	;
%%


/* error handling function */
void yyerror(char* s)
{
	printf("\033[1;31mError: \033[0;0m%s,\033[0;34m at \033[0;33m%d\033[0;0m\n",s,yylineno);
}


/* main function - calls the yyparse() function which will in turn drive yylex() as well */
int main(int argc, char* argv[])
{
	yyparse();
	return 0;
}