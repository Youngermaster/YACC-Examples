%{
#include <ctype.h>
#include <stdio.h>
#define YYSTYPE double /* double type for Yacc stack */

/* Function declarations */
int yylex(void);
int yyerror(const char *s);
%}

/* Token declarations */
%token NUMBER

/* Operator precedence */
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

/* Grammar rules */
lines : lines expr '\n' { printf("%g\n", $2); }
      | lines '\n'
      | /* empty */
      ;

expr : expr '+' expr { $$ = $1 + $3; }
     | expr '-' expr { $$ = $1 - $3; }
     | expr '*' expr { $$ = $1 * $3; }
     | expr '/' expr { $$ = $1 / $3; }
     | '(' expr ')' { $$ = $2; }
     | '-' expr %prec UMINUS { $$ = -$2; }
     | NUMBER
     ;

%%

/* Lexical analyzer */
int yylex(void) {
    int c;
    
    while ((c = getchar()) == ' ');
    
    if ((c == '.') || (isdigit(c))) {
        ungetc(c, stdin);
        scanf("%lf", &yylval);
        return NUMBER;
    }
    return c;
}

/* Error handler */
int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

/* Main function */
int main(void) {
    return yyparse();
}