command to run (for windows)
flex cucu.l
bison -d cucu.y
gcc .\lex.yy.c .\y.tab.c
a.exe sample.cu ---------------------------------------{have to give input sample file as argument}
{I use modify version of }
=================================Point to remember=============================================
Point 1- cause of recursion in BNF grammer output in Parser it print upside down some
Point 2- if error in sample.cu is present then parser print till it correct and if you want to check error in sample use lexer to find that where is stop(their error is present)
Point 3- if sample.cu does not work then try to change its extension to .txt
Point 4- any expression like a=b+c will print like id - c id - b + id - a = in parser.txt
Point 5- in line 11 in Sample2.cu I write "a+;"  which is incorrect according to my BNF rule so it show ERROR after it reach at this point and for exact location use to find that where it stop exactly, there error is present.
=================================EXAMPLE========================================================
int a,b;               ===================Input====================
int d(int , int );
int main(int a,int b)
{
  int a,b,c,d;
  a=b+89;
  d=z*y;
  a=b();
while(z!=y)
{
  int a;
}
}

==========================OUTPUT=====Lexer.txt============================
type: int
ID : a
COMMA: ,
ID : b
SEMICOL: ;
type: int
ID : d
LEFT_BRAC: (
type: int
COMMA: ,
type: int
RIGHT_BRAC: )
SEMICOL: ;
type: int
KEYWOARD MAIN: main
LEFT_BRAC: (
type: int
ID : a
COMMA: ,
type: int
ID : b
RIGHT_BRAC: )
LEFT_curly: {
type: int
ID : a
COMMA: ,
ID : b
COMMA: ,
ID : c
COMMA: ,
ID : d
SEMICOL: ;
ID : a
ASSIGN: =
ID : b
PLUS: +
NUM : 89
SEMICOL: ;
ID : d
ASSIGN: =
ID : z
ASTS: *
ID : y
SEMICOL: ;
ID : a
ASSIGN: =
ID : b
LEFT_BRAC: (
RIGHT_BRAC: )
SEMICOL: ;
KEYWOARD WHILE: while
LEFT_BRAC: (
ID : z
NOT_EQUAL: !=
ID : y
RIGHT_BRAC: )
LEFT_curly: {
type: int
ID : a
SEMICOL: ;
RIGHT_curly: }
RIGHT_curly: }
==================================OUTPUT=====PARSER.TXT=================
global variable: b
      global variable: a

======================
dec argument: int
dec argument: int
function decalaration d  ****************
=============***********
argumentd: int  a
argument: int   b
local variable: b
local variable: c
local variable: d
      local variable: a
id - + id - b + id - a =
id - y id - z * id - d =
func call b id - a =
id - z id - y  != (conditional expr)
      local variable: a

WHILE stetament 

function body main  ****************
