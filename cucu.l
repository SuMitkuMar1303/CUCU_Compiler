%{
	#include "cucu.tab.h"
%}
%%
"main"         		{yylval.string=strdup(yytext);fprintf(yyout,"KEYWOARD MAIN: %s\n",yytext);return id;}
"struct"                {yylval.string=strdup(yytext);fprintf(yyout,"KEYWOARD STRUCT: %s\n",yytext);return STRUCT;}
"while"       		{yylval.string=strdup(yytext);fprintf(yyout,"KEYWOARD WHILE: %s\n",yytext);return WHILE;}
"for"        		{yylval.string=strdup(yytext);fprintf(yyout,"KEYWOARD FOR: %s\n",yytext);return FOR;}
"if"           		{yylval.string=strdup(yytext);fprintf(yyout,"KEYWOARD IF: %s\n",yytext);return IF;}
"else"          	{yylval.string=strdup(yytext);fprintf(yyout,"KEYWOARD ELSE: %s\n",yytext);return ELSE;}
"int"           	{yylval.string=strdup(yytext);fprintf(yyout,"type: %s\n",yytext);return type;}
"char"          	{yylval.string=strdup(yytext);fprintf(yyout,"type: %s\n",yytext);return type;}
("char*")|("char *")    {fprintf(yyout,"type: %s\n",yytext);return type;}
","             	{yylval.string=strdup(yytext);fprintf(yyout,"COMMA: %s\n",yytext);return COMMA;}
^return       	        {yylval.string=strdup(yytext);fprintf(yyout,"KEYWORD RETURN: %s\n",yytext);return RETURN;}   
"-"             	{yylval.string=strdup(yytext);fprintf(yyout,"MINUS: %s\n",yytext);return SUB;}
"+"             	{yylval.string=strdup(yytext);fprintf(yyout,"PLUS: %s\n",yytext);return ADD;}
"="            		{yylval.string=strdup(yytext);fprintf(yyout,"ASSIGN: %s\n",yytext);return ASSIGN;}
"("             	{yylval.string=strdup(yytext);fprintf(yyout,"LEFT_BRAC: %s\n",yytext);return left_brac;}
")"             	{yylval.string=strdup(yytext);fprintf(yyout,"RIGHT_BRAC: %s\n",yytext);return right_brac;}
"{"             	{yylval.string=strdup(yytext);fprintf(yyout,"LEFT_curly: %s\n",yytext);return LEFT_curly;}
"}"             	{yylval.string=strdup(yytext);fprintf(yyout,"RIGHT_curly: %s\n",yytext);return RIGHT_curly;}
"["             	{yylval.string=strdup(yytext);fprintf(yyout,"LEFT_curly: %s\n",yytext);return SL_BRAC;}
"]"             	{yylval.string=strdup(yytext);fprintf(yyout,"RIGHT_curly: %s\n",yytext);return SR_BRAC;}
"<"             	{yylval.string=strdup(yytext);fprintf(yyout,"LESS_THAN: %s\n",yytext);return LT;}
">"             	{yylval.string=strdup(yytext);fprintf(yyout,"GREATER_THAN: %s\n",yytext);return GT;}
"*"          		{yylval.string=strdup(yytext);fprintf(yyout,"ASTS: %s\n",yytext);return MULT;}
"/"             	{yylval.string=strdup(yytext);fprintf(yyout,"DIVIDE: %s\n",yytext);return DIV;}
";"           		{yylval.string=strdup(yytext);fprintf(yyout,"SEMICOL: %s\n",yytext);return SEMICOL;}
">="            	{yylval.string=strdup(yytext);fprintf(yyout,"GT_EQUAL: %s\n",yytext);return GE;}
"<="            	{yylval.string=strdup(yytext);fprintf(yyout,"LT_EQUAL: %s\n",yytext);return LE;}
"=="            	{yylval.string=strdup(yytext);fprintf(yyout,"EQUALS: %s\n",yytext);return EQ;}
"!="            	{yylval.string=strdup(yytext);fprintf(yyout,"NOT_EQUAL: %s\n",yytext);return NE;}
[a-zA-A_][a-zA-Z0-9_]*  {yylval.string=strdup(yytext);fprintf(yyout,"ID : %s\n",yytext); return id;};
[0-9][0-9]*         	{ yylval.string=strdup(yytext);fprintf(yyout,"NUM : %s\n",yytext); return NUM; };          
[ \t\n]+       		; 
%%