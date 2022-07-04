#include <stdio.h>
void extfn(){}
/*
  Comment outside fn
*/
int main(){
/*
  Comment inside fn
*/
char*a="#include <stdio.h>%cvoid extfn(){}%c/*%c  Comment outside fn%c*/%cint main(){%c/*%c  Comment inside fn%c*/%cchar*a=%c%s%c;%cextfn();%cprintf(a,10,10,10,10,10,10,10,10,10,34,a,34,10,10,10,10);%c}%c";
extfn();
printf(a,10,10,10,10,10,10,10,10,10,34,a,34,10,10,10,10);
}
