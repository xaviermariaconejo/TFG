/* --Lexer-- */

%class-name Scanner

%%

[[:digit:]]+							return Parser::NUM;
[ \t\n]+                            //skip white space chars