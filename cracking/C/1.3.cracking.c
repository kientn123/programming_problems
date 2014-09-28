/*
Remove duplicate characters in a string without using any additional
buffer.
*/
#include <stdio.h>
void removeDuplicate(char* str, int len) {
  int end = 0;
  int i;
  for (i=0; i<len; i++) {
    int j;
    for (j=0; j<end; j++) {
      if (str[i] == str[j]) {
        break;
      }
    }
    if (j == end) {
      str[end] = str[i];
      end++;
    }
  }
  str[end] = '\0';
}

int main() {
  char str[20] = "abbaadasdgasgh";
  removeDuplicate(str, 14);
  printf("string: %s\n", str);
  return 0;
}
