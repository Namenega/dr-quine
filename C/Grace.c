#include <stdio.h>

/*
	This is the only comment in Grace.c
*/

#define OUTFILE	"Grace_kid.c"
#define SRC	"#include <stdio.h>%1$c%1$c/*%1$c	This is the only comment in Grace.c%1$c*/%1$c%1$c#define OUTFILE	%2$cGrace_kid.c%2$c%1$c#define SRC	%2$c%3$s%2$c%1$c#define MAIN	int main() { FILE *f = fopen(OUTFILE, %2$cw%2$c); if (f) { fprintf(f, SRC, 10, 34, SRC); fclose(f); } return 0; }%1$c%1$cMAIN%1$c"
#define MAIN	int main() { FILE *f = fopen(OUTFILE, "w"); if (f) { fprintf(f, SRC, 10, 34, SRC); fclose(f); } return 0; }

MAIN
