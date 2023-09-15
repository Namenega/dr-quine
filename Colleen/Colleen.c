#include <stdio.h>
void printSelf() {
    char *program = "#include <stdio.h>%cvoid printSelf() {%c    char *program = %c%s%c;%c    printf(program, 10, 10, 34, program, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c/* This is a comment outside the main function */%cint main() {%c    /* This is a comment inside the main function */%c    printSelf();%c    return 0;%c}%c";
    printf(program, 10, 10, 34, program, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}
/* This is a comment outside the main function */
int main() {
    /* This is a comment inside the main function */
    printSelf();
    return 0;
}
