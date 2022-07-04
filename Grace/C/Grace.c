#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
/*
  Grace writes its source code into a new file named Grace_kid.c
*/
#define flags O_WRONLY|O_CREAT|O_TRUNC
#define mode 0644
#define FT(x)int main(){int fd=open("Grace_kid.c",flags,mode);dprintf(fd,x,10,10,10,10,10,10,10,10,34,34,10,34,x,34,10);close(fd);return 0;}
FT("#include <stdio.h>%c#include <fcntl.h>%c#include <unistd.h>%c/*%c  Grace writes its source code into a new file named Grace_kid.c%c*/%c#define flags O_WRONLY|O_CREAT|O_TRUNC%c#define mode 0644%c#define FT(x)int main(){int fd=open(%cGrace_kid.c%c,flags,mode);dprintf(fd,x,10,10,10,10,10,10,10,10,34,34,10,34,x,34,10);close(fd);return 0;}%cFT(%c%s%c)%c")
