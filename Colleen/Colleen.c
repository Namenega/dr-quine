#include <stdio.h>

/* Comment 1 */

void print() {
	char* s = "#include <stdio.h>%c%c/* Comment 1 */%c%cvoid print() {%c%cchar *c = %c%s%c;%c%c%cprintf(s, 10, 10, 10, 10, 9, 34, s, 34, 10, 10, 9, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10);%c}%c%cint main() {%c%c/* Call print() */%c%cprint();%c%creturn (0);%c}";
	
	printf(s, 10, 10, 10, 10, 10, 9, 34, s, 34, 10, 10, 9, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10);
}

int main() {
	/* Call print() */
	print();
	return (0);
}
