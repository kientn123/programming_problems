/*
Given a string, check if it is a rotation of a palindrome string
*/
// O(n^2) naive algorithm
function isRotation(s) {
  var i;

  function checkAtPosition(pos, isOdd) {
    var j;
    if (isOdd) {
      for (j=1; j<=s.length/2; j++) {
        if (s[(pos-j+s.length)%s.length] != s[(pos+j)%s.length]) {
          return false;
        }
      }
      return true;
    } else {
      for (j=0; j<s.length/2; j++) {
        if (s[(pos-j+s.length)%s.length] != s[(pos+j)%s.length]) {
          return false;
        }
      }
      return true;
    }
  }

  for (i=0; i<s.length; i++) {
    if (checkAtPosition(i, s.length%2==1)) {
      return true;
    }
  }
  return false;
}

console.log(isRotation("aaaad"));
