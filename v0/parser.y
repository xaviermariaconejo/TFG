%scanner                  	lexer/Scanner.ih
%scanner-token-function		d_scanner.lex()
%baseclass-preinclude		cmath
%stype						double

%token NUM
%left '-' '+'
%left '*' '/'
%left NEG
%right '^'

%%

input:
	//empty
|
	input line
;

line:
	'\n'
|
	exp '\n'
	{
		std::cout << "\t" << $1 << '\n';
	}
;

exp:
	NUM
|
	exp '+' exp
	{
		$$ = $1 + $3;
	}
|
	exp '-' exp
	{
		$$ = $1 - $3;
	}
|
	exp '*' exp
	{
		$$ = $1 * $3;
	}
|
	exp '/' exp
	{
		$$ = $1 / $3;
	}
|
	'-' exp %prec NEG
	{
		$$ = -$2;
	}
|
	exp '^' exp
	{
		$$ = pow($1, $3);
	}
|
	'(' exp ')'
	{
		$$ = $2;
	}
;