/*
Reverse a C-style string
*/
#include <stdio.h>

void reverse(char* str) {
  if (str) {
    char* end = str;
    while (*end) {
      ++end;
    }
    --end;
    char temp;
    while (str < end) {
      temp = *str;
      *str = *end;
      str++;
      *end = temp;
      end--;
    }
  }
}

int main() {
  char str1[30] = "Please Enter Your Name";
  char str2[20] = "uniq chas";
  //char* str1 = "reverse"; will get bus error if declaring string like this
  //char* str2 = "iowastate";
  reverse(str1);
  reverse(str2);
  printf("first string: %s\n", str1);
  printf("second string: %s\n", str2);
  return 0;
}
