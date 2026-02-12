#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main() {
	int i = 5;
	char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c#include <unistd.h>%1$c%1$cint main() {%1$c	int i = %2$d;%1$c	char *s = %3$c%4$s%3$c;%1$c	char filename[20];%1$c	char cmd[100];%1$c%1$c	if (access(%3$cSully_5.c%3$c, F_OK) == 0) {%1$c		i--;%1$c	}%1$c%1$c	if (i < 0)%1$c		return 0;%1$c%1$c	sprintf(filename, %3$cSully_%%d.c%3$c, i);%1$c	FILE *f = fopen(filename, %3$cw%3$c);%1$c	if (f) {%1$c		fprintf(f, s, 10, i, 34, s);%1$c		fclose(f);%1$c	}%1$c%1$c	sprintf(cmd, %3$cgcc -Wall -Wextra -Werror %%s -o Sully_%%d%3$c, filename, i);%1$c	system(cmd);%1$c%1$c	sprintf(cmd, %3$c./Sully_%%d%3$c, i);%1$c	system(cmd);%1$c%1$c	return 0;%1$c}%1$c";
	char filename[20];
	char cmd[100];

	if (access("Sully_5.c", F_OK) == 0) {
		i--;
	}

	if (i < 0)
		return 0;

	sprintf(filename, "Sully_%d.c", i);
	FILE *f = fopen(filename, "w");
	if (f) {
		fprintf(f, s, 10, i, 34, s);
		fclose(f);
	}

	sprintf(cmd, "gcc -Wall -Wextra -Werror %s -o Sully_%d", filename, i);
	system(cmd);

	sprintf(cmd, "./Sully_%d", i);
	system(cmd);

	return 0;
}
