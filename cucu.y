%{
#include <stdio.h>

	FILE *pex;
	void yyerror(char *s) {fprintf(pex,"ERROR\n");}
	int yywrap(void) {
 	return 1;
	}

%}
%union{
int number;
char *string;
}
%token<string> id IF ELSE WHILE STRUCT LEFT_curly RIGHT_curly SL_BRAC SR_BRAC ASSIGN SEMICOL SUB ADD MULT DIV left_brac right_brac GE LE LT GT EQ NE  type COMMA RETURN NUM FOR
%%
start : start prog
      | prog
      ;
prog  	:  gvar_dec
	      |  //fun_dec
            |  fun_body
	      ;
fun_dec	:  type id  left_brac dec_argulistopt right_brac SEMICOL {fprintf(pex,"function decalaration %s  ****************\n",$2);}

dec_argulistopt: dec_argulist 
                | {fprintf(pex,"======================\n");}
                ;
dec_argulist: dec_argulist COMMA type  {fprintf(pex,"dec argument: %s\n",$3);}
	    |  type  {fprintf(pex,"======================\n");fprintf(pex,"dec argument: %s\n",$1);}
	    ;
fun_body :   type id  left_brac argulistopt right_brac LEFT_curly stmts RIGHT_curly {fprintf(pex,"function body %s  ****************\n",$2);} 
argulistopt: argulist
                | {fprintf(pex,"=============***********\n");}
                ;
argulist: argulist COMMA type id {fprintf(pex,"argument: %s   %s\n",$3,$4);}
	    |  type id  {fprintf(pex,"=============***********\n");fprintf(pex,"argumentd: %s  %s\n",$1, $2);}
	    ;
stmts: stmts stmt 
      |stmt 
      ;
stmt:  expr            
      |var_dec
      |SEMICOL
      |conditional
      |loop
      |inc
      |struct
      |array_dec
      |string_dec
      ;
struct: STRUCT id LEFT_curly SOPT RIGHT_curly SEMICOL
SOPT: SOPT var_dec
      | SOPT array_dec
      | SOPT string_dec
      |
      ;
expr: 
    |  expr LE expr {fprintf(pex," <= (conditional expr)\n");}
    |  expr GE expr {fprintf(pex," >= (conditional expr)\n");}
    |  expr NE expr {fprintf(pex," != (conditional expr)\n");}
    |  expr EQ expr {fprintf(pex," == (conditional expr)\n");}
    |  expr GT expr {fprintf(pex," > (conditional expr)\n");}
    |  expr LT expr {fprintf(pex,"< (conditional expr)\n");}
    |  assignment
//     |  left_brac expr right_brac
    ;
inc: id ADD ADD SEMICOL {fprintf(pex," %s + +\n",$1);}
assignment: id ASSIGN  assignment {fprintf(pex,"id - %s =\n",$1);}
          | id ASSIGN fun_call {fprintf(pex,"id - %s =\n",$1);}
          |id ADD assignment {fprintf(pex,"id - %s %s ",$1,$2);}
          | id SUB assignment {fprintf(pex,"id - %s %s ",$1,$2);}
          | id MULT assignment {fprintf(pex,"id - %s %s ",$1,$2);}
          | id DIV  assignment {fprintf(pex,"id - %s %s ",$1,$2);}
          | NUM ADD assignment {fprintf(pex,"constant - %s %s RJKRHGKDJHGFKFDJH",$1,$2);}
          | NUM SUB assignment {fprintf(pex,"constant - %s %s ",$1,$2);}
          | NUM MULT assignment {fprintf(pex,"constant - %s %s ",$1,$2);}
          | NUM DIV  assignment {fprintf(pex,"constant - %s %s ",$1,$2);}
          | left_brac assignment right_brac {fprintf(pex,"{  }\n");}
          | NUM {fprintf(pex,"constant- %s ",$1);}
          | id  {fprintf(pex,"id - %s ",$1);}
          ;
gvar_dec:  type id dec_Gopt SEMICOL {fprintf(pex,"      global variable: %s\n\n",$2);}
dec_Gopt: dec_Gopt COMMA id         {fprintf(pex,"global variable: %s\n",$3);}
      |
      ;
var_dec:  id type  dec_opt SEMICOL {fprintf(pex,"      local variable: %s\n",$2);}
dec_opt: dec_opt COMMA id         {fprintf(pex,"local variable: %s\n",$3);}
      |             
      ;
conditional: IF left_brac expr right_brac LEFT_curly stmts RIGHT_curly elseopt  {fprintf(pex,"\nIF: stetament \n\n");}
elseopt: ELSE LEFT_curly expr RIGHT_curly
      |
      ;
loop: WHILE left_brac expr right_brac LEFT_curly stmts RIGHT_curly {fprintf(pex,"\nWHILE stetament \n\n");}
      |  FOR left_brac expropt SEMICOL expropt SEMICOL expropt right_brac LEFT_curly stmts RIGHT_curly {fprintf(pex,"\nFOR: stetament \n\n");}
expropt: expr
      |
      ;
fun_call: id left_brac tran_argulistopt right_brac SEMICOL  {fprintf(pex,"func call %s ",$1);}
tran_argulistopt: tran_argulist 
                | 
                ;
tran_argulist: tran_argulist COMMA id  {fprintf(pex,"function argument: %s\n",$3);}
	    |  id  {fprintf(pex,"function argument: %s\n",$1);}
	    ;
array_dec: type id SL_BRAC NUM SR_BRAC SEMICOL
string_dec: type id SL_BRAC NOPT SR_BRAC SEMICOL
NOPT: NUM
      |
      ;

%%
int main(int argc ,char *argv[]){
    extern FILE *yyin,*yyout;
    yyin=fopen(argv[1],"r");
    yyout=fopen("Lexer.txt","w");
    pex=fopen("parser.txt","w");
    yyparse();

    return 0;
}