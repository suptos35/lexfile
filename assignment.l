%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
%}
variable [a-zA-Z][a-zA-Z0-9]*[_]?[a-zA-Z0-9]*
digit [0-9]
header		"import ".*
Comment		[@].*
Multi "@@"[^@@]*"@@"

%%
{digit}+	      {yylval.intt = atoi(yytext); printf("Number: %d\n", yylval.intt); }
"IF" 			  {printf("if started\n"); }
"ELSE" 		      {printf("else started\n"); }
"ELIF"            {printf("elif started\n"); }
"WHILE"		      {printf("while started\n"); }
"LOOP" 		      {printf("loop started\n"); }
"CASE" 			  {printf("case started\n"); }
"SWITCH" 		  {printf("switch case\n"); }
"DEFAULT" 		  {printf("default case\n"); }
"DEKHAW"		  {printf("print\n"); }
"PORO"			  {printf("read\n"); }
"ARRAY"			  {printf("array type\n"); }
"FACTORIAL"       {printf("factorial function\n"); }
"ODDEVEN"		  {printf("oddeven function\n"); } 
"LEAPYEAR"		  {printf("leapyear function\n"); }
"PALINDROME"      {printf("palindrome function\n"); }
"POWER"			  {printf("power function\n"); }
"PRIME"           {printf("prime function\n"); }
"MAX"			  {printf("max function\n"); }
"GCD"             {printf("gcd function\n"); }
"LCM"             {printf("lcm function\n"); }
"TRY"		      {printf("try block\n"); }
"CATCH"		      {printf("catch block\n"); }
"CLASS"	          {printf("Class Name = "); }
"<>"              {printf("<>\n"); }
"[[[" 		      {printf("[[[\n"); }
"]]]"  		      {printf("]]]\n"); }
"[" 		      {printf("[\n"); }
"]"  		      {printf("]\n"); }
"|"               {printf("|\n"); }
"INTEGER"  		  {printf("integer type\n"); }
"CHARACTER" 	  {printf("character type\n"); }
"FLOAT"			  {printf("float type\n"); }
"JOG"			  {printf("plus operator\n"); }
"BIOG"            {printf("minus operator\n"); }
"GUN"             {printf("multiply operator\n"); }
"VAG"             {printf("divide operator\n"); }
"MOD"             {printf("mod operator\n"); }
"AND"			  {printf("and operator\n"); }
"OR"			  {printf("or operator\n"); }
"XOR"			  {printf("xor operator\n"); }
"GT"              {printf("gt operator\n"); }
"LT"              {printf("lt operator\n"); }
"SINE"   		  {printf("sine operator\n"); }
"COSINE"		  {printf("cosine operator\n"); }
"TANGENT"		  {printf("tangent operator\n"); }
"LOGARITHM"       {printf("logarithm operator\n"); }
"SQRT"			  {printf("sqrt operator\n"); }
"SHURU"	          {printf("\nMAIN Function started\n"); }
{header}  		  {printf("Header file \n");ECHO;printf("\n"); }
{Comment}		  {printf("\nSingle comment = ");ECHO;printf("\n\n"); }
{Multi}			  {printf("\nMulti comment= ");ECHO;printf("\n\n"); }
[-+/*<>=,():;%^]  {printf("Symbol: %c\n", yytext[0]); }
{variable}	      {ECHO;printf("\n"); printf("Variable: %s\n", yytext); }
[ ]*	    	  {}
[\n]*			  {}
[\t]*			  {}
.				  {printf("\nUnknown syntax : %s\n", yytext); }

%%
