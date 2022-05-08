%s state
%{
    #include <stdio.h>
    #include <stdlib.h>
    int yywrap();
    void yyerror(char *s);
    int count = 0;
%}
%%
("//")(.*) {fprintf(yyout, " "); count++;}
\/\*    {yymore(); BEGIN state;}
<state>[' '|\t|\n]  {yymore(); BEGIN state;}
<state>[^\*]    {yymore(); BEGIN state;}
<state>"*"[^/]  {yymore(); BEGIN state;}
<state>"*"\/    {fprintf(yyout, " "); BEGIN 0; count++;}
%%
int yywrap() { return 1; }
void yyerror(char *s) { fprintf(stderr, "error: %s\n", s); }
// extern int linenum;
// void yyerror(char *s) {
//     fprintf(stderr, " line %d: %s\n", linenum, s);
// }
FILE *yyin, *yyout;
int main() {
    yyin = fopen("lex.yy.c", "r");
    yyout = fopen("output.c", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    printf("The total number of comments found %d\n", count);
    return 0;
}
