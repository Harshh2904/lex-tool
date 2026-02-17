%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token NUMBER IDENTIFIER
%token PLUS MINUS MULT DIV

%%

input:
      /* empty */
    | input line
    ;

line:
      expr '\n' { printf("Valid Expression\n"); }
    ;

expr:
      expr PLUS term   { /* addition */ }
    | expr MINUS term  { /* subtraction */ }
    | term
    ;

term:
      term MULT factor { /* multiplication */ }
    | term DIV factor  { /* division */ }
    | factor
    ;

factor:
      NUMBER
    | IDENTIFIER
    | '(' expr ')' 
    ;

%%

void yyerror(const char *s) {
    printf("Syntax Error\n");
}

int main() {
    printf("Enter expressions (Ctrl+D to exit):\n");
    yyparse();
    return 0;
}

