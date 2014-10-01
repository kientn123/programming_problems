/*
Decide if two strings are anagrams
*/
#include <stdio.h>

int isAnagram(char *s, char *t) {
  if (s && t) {
    char sCount[256];
    int numUniqueCharsInS, numUniqueCharsTSoFar;
    printf("numUniqueCharsInS is: %d\n", numUniqueCharsInS);
    printf("numUniqueCharsTSoFar is: %d\n", numUniqueCharsTSoFar);
    while (*s) {
      if (!sCount[*s]) {
        numUniqueCharsInS++;
      }
      sCount[*s]++;
      s++;
    }
    printf("numUniqueCharsInS: %d\n", numUniqueCharsInS);
    while (*t) {
      if (!sCount[*t]) {
        return 0;
      }
      sCount[*t]--;
      if (!sCount[*t]) {
        ++numUniqueCharsTSoFar;
        printf("numUniqueCharsTSoFar: %d\n", numUniqueCharsTSoFar);
        if (numUniqueCharsInS == numUniqueCharsTSoFar) {
          return *(++t) == '\0';
        }
      }
      ++t;
    }
    return 1;
  } else {
    return 0;
  }
}

int main() {
  char s[10] = "anagram";
  char t[10] = "maaargn";
  printf("is anagram: %d\n", isAnagram(s, t));
  return 0;
}
