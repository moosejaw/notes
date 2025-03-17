#include <stdio.h>

int main()
{
  int a = 10;
  int *p = &a;

  int **pp = &p;

  printf("Dereferenced p = %d\n", **pp);
}
