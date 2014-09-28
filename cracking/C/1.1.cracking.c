/*
Determine if a string has all unique characters
*/

#include <stdio.h>
#include <string.h>

int allUnique(char* str, int len) {
  int toReturn = 0;
  for (int i=0; i<len; i++) {
    if (str[i] != ' ') {
      int x = 1 << str[i];
      if (toReturn & x) {
        return 0;
      } else {
        toReturn ^= x;
      }
    }
  }
  return 1;
}

int main() {
  char str[30] = "Please Enter Your Name";
  char str2[20] = "uniq chas";
  printf("result 1: %d\n", allUnique(str, 19));
  printf("result 2: %d\n", allUnique(str2, 8));
}
