/*
Test for palindromic permutations
Write a program to test whether the letters forming a string s can be permuted to form a
palindrome
*/
function isRotationOfPalindrome(s) {
    var hash = {};
    for (var i=0; i<s.length; i++) {
        if (hash[s[i]] == undefined) {
            hash[s[i]] = 0;
        }
        hash[s[i]]++;
    }
    var oddCount = 0;
    for (char in hash) {
        if (hash[char]&1) {
            oddCount++;
            if (oddCount > 2) {
                return false;
            }
        }
    }
    return true;
}
console.log(isRotationOfPalindrome("edified"));
console.log(isRotationOfPalindrome("example"));
