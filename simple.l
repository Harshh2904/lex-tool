%{
#include <stdio.h>
%}

%%
[0-9]+      { printf("NUMBER: %s\n", yytext); }
[a-zA-Z]+   { printf("WORD: %s\n", yytext); }
\n          { /* ignore newlines */ }
.           { /* ignore other characters */ }
%%

int main(int argc, char **argv) {
    yylex();   // call the lexer
    return 0;
}