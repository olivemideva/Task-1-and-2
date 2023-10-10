%{
#include <stdio.h>
#include <stdbool.h>
// Declare and initialize variables
int comment_lines = 0; // Counter for comment lines
bool in_comment = false; // Flag to track if currently in a multi-line comment
%}

%%

// Lex specifications
"//".*\n { ++comment_lines; } // Match C++ style comments and increment the counter

%%

// yywrap() function indicating end of input
int yywrap() {
    return 1;
}

// Main function
int main(void) {
    // Prompt the user to enter an input file name
    printf("Enter input file: ");
    char filename[64];
    scanf("%s", filename);
    yyin = fopen(filename, "r"); // Open input file

    // Prompt the user to enter an output file name
    printf("Enter output file: ");
    scanf("%s", filename);
    yyout = fopen(filename, "w"); // Open output file

    yylex(); // Start lexical analysis
    printf("Number of comments: %d\n", comment_lines); // Print the number of comments found
}
