#include <stdio.h>
int main()
{
  int A[5] = { 5, 2, 4, 5, 6 };
  int *p;

  p = &A[0]; // store the address of the first element in the pointer

  printf("element 1 : %d\n", *p);

  p = p + 1;

  printf("element 2 : %d\n", *p);

}

