/* --Lexer-- */

%class-name Scanner
DIGIT 		[0-9]

%%

//'='								return '=';
'+'								return '+';
'-'								return Parser::MINUS;
'*'								return Parser::MULT;
'/'								return Parser::DIV;
//'^'								return '^';
//'('								return '(';
//')'								return ')';
{DIGIT}+						return Parser::NUM;
//[[:alpha:]_][[:alnum:]_]*		return Parser::ID;
'\n'							return '\n';
