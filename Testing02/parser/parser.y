/* --Parser-- */

%scanner                  ../lexer/Scanner.ih
%scanner-token-function     d_scanner.lex()
%baseclass-preinclude       cmath

/*%union
{
    double u_val;
    double *u_symbol;
}

%token <u_val>      INT
%token <u_val>      DOUBLE
%token <u_symbol>   ID
%type <u_val>      exp
*/
%token NUM
%stype double
%right  '='
%left   '-' '+'
%left   '*' '/'
%left   NEG
%right  '^'


%%


input:
    // empty
|
    input line
;

line:
    '\n'
|
    exp '\n'
    {
        std::cout << "\t EXP " << $1 << '\n';
    }
;

exp:
    INT 
|
    /*ID
    {
        $$ = *$1;
    }
|
    ID '=' exp
    {
        $$ = *$1 = $3;
    }
|*/
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