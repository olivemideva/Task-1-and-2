%{
#include <stdio.h>
#include <stdbool.h>
int comment_lines = 0;
bool in_comment = false;
%}

%%

"//".*\n { ++comment_lines; }

%%

int yywrap() {
    return 1;
}

int main(void) {
    printf("Enter input file: ");
    char filename[64];
    scanf("%s", filename);
    yyin = fopen(filename, "r");

    printf("Enter output file: ");
    scanf("%s", filename);
    yyout = fopen(filename, "w");

    yylex();
    printf("Number of comments: %d\n", comment_lines);
}