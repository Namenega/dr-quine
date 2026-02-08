#include <stdio.h>

/*
	This is a comment outside the main function.
*/

void func() { return; }

int main() {
	/*
		This is a comment inside the main function.
	*/
	char *s = "#include <stdio.h>%1$c%1$c/*%1$c	This is a comment outside the main function.%1$c*/%1$c%1$cvoid func() { return; }%1$c%1$cint main() {%1$c	/*%1$c		This is a comment inside the main function.%1$c	*/%1$c	char *s = %2$c%3$s%2$c;%1$c	func();%1$c	printf(s, 10, 34, s);%1$c	return 0;%1$c}%1$c";
	func();
	printf(s, 10, 34, s);
	return 0;
}
