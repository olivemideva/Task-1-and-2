
 
/*** Rule Section has three rules, first rule
checks for small letters, capital letters and numbers, second rule
matches with anything that is not a small letter, capital letter or number***/
%%
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Valid identifier: %s\n", yytext);
}

. {
    printf("Invalid identifier: %s\n", yytext);
}
%%
 
/*** Code Section prints whether or not the given input is valid***/
int yywrap(){}
int main(){
yylex(); 
return 0;
}