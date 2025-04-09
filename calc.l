%{
#include "calc.tab.h"
%}
%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+\-*/\n]   { return yytext[0]; }
[ \t]       ;  // ignore spaces
.           { printf("Unexpected character: %s\n", yytext); }
%%
int yywrap(void) {
    return 1;
}
