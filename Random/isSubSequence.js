/*
Given two strings s1 and s2, find if s1 is a subsequence of s2. A subsequence
is a sequence that can be derived from another sequence by deleting some
elements without changing the order of the remaining elements
*/
function isSubSequence(s1, s2) {
  var s1Runner = 0, s2Runner = 0;
  while (s1Runner < s1.length && s2Runner < s2.length) {
    if (s1[s1Runner] == s2[s2Runner]) {
      s1Runner++; s2Runner++;
    } else {
      s2Runner++;
    }
  }
  return s1Runner==s1.length ? true : false;
}

console.log(isSubSequence("AXY", "ADXCPY"));
console.log(isSubSequence("AXY", "YADXCP"));
console.log(isSubSequence("gksrek", "geeksforgeeks"));
