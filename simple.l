%{
#include "y.tab.h"  // Include Yacc token definitions
%}

%%
[0-9]+      { return NUMBER; }
[a-zA-Z]+   { return IDENTIFIER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MULT; }
"/"         { return DIV; }
"("         { return '('; }
")"         { return ')'; }
[ \t]+      ;           /* ignore spaces and tabs */
\n          { return '\n'; }  /* important: send newline to parser */
.           { return yytext[0]; }
%%

int yywrap() { return 1; }
