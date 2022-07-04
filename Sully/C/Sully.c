#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define FMT "#include <stdio.h>%c#include <stdlib.h>%c#include <string.h>%c#define FMT %c%s%c%c%cint main() {%cint c = %d;%cchar *f,*cmd;%c%cif (c == 0) return 0;%cif (strlen(__FILE__)>7) c--;%casprintf(&f, %cSully_%cd.c%c,c);%cFILE *F = fopen(f, %cw%c);%cfprintf(F,FMT, 10,10,10,34,FMT,34,10,10,10,c,10,10,10,10,10,34,37,34,10,34,34,10,10,10,34,37,37,37,34,10,10,10,10,10,10);%cfclose(F);%casprintf(&cmd, %cclang %cs -o Sully_%cd && ./Sully_%cd%c,f,c,c);%csystem(cmd);%cfree(cmd);%cfree(f);%creturn 0;%c}%c"

int main() {
int c = 5;
char *f,*cmd;

if (c == 0) return 0;
if (strlen(__FILE__)>7) c--;
asprintf(&f, "Sully_%d.c",c);
FILE *F = fopen(f, "w");
fprintf(F,FMT, 10,10,10,34,FMT,34,10,10,10,c,10,10,10,10,10,34,37,34,10,34,34,10,10,10,34,37,37,37,34,10,10,10,10,10,10);
fclose(F);
asprintf(&cmd, "clang %s -o Sully_%d && ./Sully_%d",f,c,c);
system(cmd);
free(cmd);
free(f);
return 0;
}
