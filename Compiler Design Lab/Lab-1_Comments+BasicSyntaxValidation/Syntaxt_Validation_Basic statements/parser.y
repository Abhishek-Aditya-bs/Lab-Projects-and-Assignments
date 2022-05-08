%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yylineno;
extern char* yytext;
extern int yychar;
int has_error = 0;
void yyerror(const char * s); 
%}
%token INT FLOAT DOUBLE CHAR SHORT VOID STRLITERAL CHARLITERAL LONG
%token IDENTIFIER VALUE INVALID_ID
%token INCLUDE HEADER
%token MAIN RETURN PRINTF SCANF

%token MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN ADD_ASSIGN SUB_ASSIGN LEFT_ASSIGN RIGHT_ASSIGN
%token AND_ASSIGN OR_ASSIGN XOR_ASSIGN RIGHTSHIFT LEFTSHIFT

%token LTEQ GTEQ EQ EQCOMP NE LAND LOR TRUE FALSE COLON UADD USUB
%token IF ELSEIF ELSE SWITCH CASE
%token FOR WHILE DO 
%token CONTINUE BREAK
%token SCOMMENT MCOMMENT 

%start translation_unit

%left '+' '-'
%left '*' '/'

%error-verbose
%%

translation_unit
  : Program {if(has_error==0) {printf("Valid Syntax!\n"); YYACCEPT;} else{printf("Invalid Syntax!\n");} }

Program
  : INCLUDE '<' HEADER '>' Program
  | declaration Program
  | expression ';' Program
  | comment Program
  | main
  | error Program {has_error=1;}
  ;

type_specifiers
  : INT
  | SHORT
  | CHAR
  | FLOAT
  | DOUBLE
  | LONG INT
  | LONG LONG INT
  | VOID
  ;

variable_list
  : IDENTIFIER 
  | IDENTIFIER EQ expression
  | variable_list ',' variable_expression
  ;

declaration
  : type_specifiers variable_expression ';'
  ;

array_dimensions
  : '[' ']'
  | '[' VALUE ']'
  | '[' ']' array_dimensions
  | '[' VALUE ']' array_dimensions
  ;

array_initializer
  : '{' expression '}'
  | '{' array_initializer '}'
  | array_initializer ',' variable_expression
  ;

variable_expression
  : array_dimensions 
  | array_initializer
  | IDENTIFIER array_dimensions
  | IDENTIFIER array_dimensions variable_expression
  | EQ array_initializer
  | EQ array_initializer variable_expression
  | variable_list
  | error {has_error=1;}
  ;

primary_expression
  : IDENTIFIER
  | VALUE
  | CHARLITERAL
  | STRLITERAL
  | '(' expression ')'
  ;

postfix_expression
  : primary_expression
  | postfix_expression '[' expression ']'
  | postfix_expression '(' expression ')'
  | postfix_expression UADD
  | postfix_expression USUB
  ;

unary_expression
  : postfix_expression
  | UADD unary_expression
  | USUB unary_expression
  | unary_operator cast_expression
  ;


unary_operator
  : '&'
  | '~'
  | '!'
  ;

cast_expression
  : unary_expression
  | '(' type_specifiers ')' cast_expression
  ;

multiplicative_expression
  : cast_expression
  | multiplicative_expression '*' cast_expression
  | multiplicative_expression '/' cast_expression
  | multiplicative_expression '%' cast_expression
  ;

additive_expression
  : multiplicative_expression
  | additive_expression '+' multiplicative_expression
  | additive_expression '-' multiplicative_expression
  ;

shift_expression
  : additive_expression
  | shift_expression LEFTSHIFT additive_expression
  | shift_expression RIGHTSHIFT additive_expression
  ;

relational_expression
  : shift_expression
  | relational_expression '<' shift_expression
  | relational_expression '>' shift_expression
  | relational_expression LTEQ shift_expression
  | relational_expression GTEQ shift_expression
  ;

equality_expression
  : relational_expression
  | equality_expression EQCOMP relational_expression
  | equality_expression NE relational_expression
  ;

logical_and_expression
  : equality_expression
  | logical_and_expression LAND equality_expression
  ;

logical_or_expression
  : logical_and_expression
  | logical_or_expression LOR logical_and_expression
  ;

conditional_expression
  : logical_or_expression
  | logical_or_expression '?' expression ':' logical_and_expression
  ;

assignment_expression
  : conditional_expression
  | unary_expression assignment_operators assignment_expression
  ;

assignment_operators
  : EQ
  | ADD_ASSIGN
  | SUB_ASSIGN
  | MUL_ASSIGN
  | DIV_ASSIGN
  | MOD_ASSIGN
  | XOR_ASSIGN
  | AND_ASSIGN
  | OR_ASSIGN
  | RIGHT_ASSIGN
  | LEFT_ASSIGN
  ;

expression
  : assignment_expression
  | expression ',' assignment_expression
  ;

code_block
  : '{' statements '}'
  ;

statements
  : statement statements
  | code_block statements
  | 
  ;

statement
  : declaration
  | expression ';'
  | conditional_statements
  | iteration_statements
  | label_statements
  | jump_statements
  | input_output_statements
  | comment 
  | error ',' {has_error=1; yyerrok;}
  | error ';' {has_error=1; yyerrok;}
  ;

conditional_statements 
  : IF '(' condition ')' statements ELSEIF '(' condition ')' statements ELSE statements
  | IF '(' condition ')' statements ELSE statements
  | IF '(' condition ')' statements
  | SWITCH '(' condition ')' statements
  ;

condition
  : expression
  ;

expression_statements
  : ';'
  | expression ';'
  ;

iteration_statements
  : WHILE '(' condition ')' statements 
  | DO statements WHILE '(' condition ')' ';'
  | FOR '(' expression_statements expression_statements ')' statements
  | FOR '(' expression_statements expression_statements expression ')' statements
  | FOR '(' declaration expression_statements ')' statements
  | FOR '(' declaration expression_statements expression ')' statements
  ;

label_statements
  : CASE conditional_expression COLON statement
  ;

jump_statements
  : CONTINUE ';'
  | BREAK ';'
  | return
  ;

input_output_statements
  : SCANF '(' input_output_expression ')' ';'
  | PRINTF '(' input_output_expression ')' ';'
  ;

input_output_expression
  : STRLITERAL
  | input_output_expression ',' expression
  ;

main
  : type_specifiers MAIN '(' main_arguments ')' code_block
  ;

main_arguments
  : type_specifiers IDENTIFIER
  | type_specifiers IDENTIFIER ',' main_arguments
  |
  ;

comment
  : SCOMMENT
  | MCOMMENT
  ;

return
  : RETURN expression ';'
  ;

%%

void yyerror(const char * s){
  printf("\033[91;m%s\033[97;m: Line Number : %d, Token : '%s'\n\033[0m",s,yylineno,yytext);
}
int main(){
  if(yyparse()){
    printf("Could not Parse!\n");
  }
  else{
    printf("Parsed!\n");
  }
  return 0;
}