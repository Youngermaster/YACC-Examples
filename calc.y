%{
#include <stdio.h>
#include <stdlib.h>

/* Tell compiler about yylex() and yyerror() before using them */
int yylex(void);
int yyerror(const char *s);

%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
input:
    | input line
    ;

line:
    '\n'
    | expr '\n'    { printf("= %d\n", $1); }
    ;

expr:
    NUMBER         { $$ = $1; }
    | expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    ;
%%

int main(void) {
    printf("Simple Calculator: enter expressions like 3 + 5\n");
    yyparse();
    return 0;
}

/* Match the prototype above: */
int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
