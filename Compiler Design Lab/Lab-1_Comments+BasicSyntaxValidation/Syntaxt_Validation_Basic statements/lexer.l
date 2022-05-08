%{
#include <stdio.h>
#include "y.tab.h"
extern int yylineno;
void yyerror(const char * s);
%}
%%

int	return INT;
float	return FLOAT;
double	return DOUBLE;
short return SHORT;
char	return CHAR;
void return VOID;
long  return LONG;
\'(.)\' return CHARLITERAL;
L?\"(\\.|[^\\"\n])*\"  return STRLITERAL;

if	return IF;
"else if"	return ELSEIF;
else	return ELSE;
switch return SWITCH;
case return CASE;

for return FOR;
while	return WHILE;
do  return DO;

">>="	return RIGHT_ASSIGN; 
"<<="	return LEFT_ASSIGN; 
"+="	return ADD_ASSIGN; 
"-="	return SUB_ASSIGN; 
"*="	return MUL_ASSIGN; 
"/="	return DIV_ASSIGN; 
"%="	return MOD_ASSIGN; 
"&="	return AND_ASSIGN; 
"^="	return XOR_ASSIGN; 
"|="	return OR_ASSIGN;
">>"	return RIGHTSHIFT;
"<<"	return LEFTSHIFT;
"<="	return LTEQ;
">="	return GTEQ;
"==" return EQCOMP;
"!=" return NE;
"=" return EQ;
":" return COLON;
"||"  return LOR;
"&&"  return LAND;
"++"  return UADD;
"--"  return USUB;
true	return TRUE;
false	return FALSE;
"continue" return CONTINUE;
"break" return BREAK;
"#include"	return INCLUDE;
"printf"  return PRINTF;
"scanf" return SCANF;
main	return MAIN;
"return"	{return RETURN;}	

[_a-zA-Z]([a-zA-Z0-9_/])*[.][h]	return HEADER;
[_a-zA-Z]([a-zA-Z0-9_])*	return IDENTIFIER;
^[a-z_$]([a-zA-Z0-9])*  return INVALID_ID;
[0-9.]+ return VALUE;

"//"(.|^\n)*  return SCOMMENT;
"/*"(.|\n)*"*/" return MCOMMENT;

[ \t]	;
[\n]	{yylineno++;}

.	return *yytext;

%%
int yywrap(){
  return 1;
	
}