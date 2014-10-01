/*
Replace all the spaces in a string with %20
*/

#include <stdio.h>
#include <ctype.h>

void replace(char *s, int len, char* t) {
  int i, numOfSpaces;
  printf("i is: %d\n", i);
  printf("numOfSpaces: %d\n", numOfSpaces);
  for (i=0; i<len; i++) {
    if (isspace(s[i])) {
      numOfSpaces++;
    }
  }
  printf("numOfSpaces: %d\n", numOfSpaces);
  int runner = 0;
  while (*s) {
    if (isspace(*s)) {
      t[runner++] = '%';
      t[runner++] = '2';
      t[runner++] = '0';
    } else {
      t[runner++] = *s;
    }
    s++;
  }
  t[runner] = '\0';
}

int main() {
  char s[30] = "I love you";
  char t[30];
  replace(s, 10, t);
  printf("modified string is: %s\n", t);
  return 0;
}
